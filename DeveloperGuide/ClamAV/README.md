# Antivirus scanning for non‑managed devices

Uploading from non-managed computers is a common malware entry point. To protect workspaces, every file must land in a staging area, be scanned by ClamAV, and only then become accessible or move into workspace storage.

See [requirements](./requirements.md) for overview.

This page documents the virus scanning workflow for FSDH. It explains the actors, the sequence of operations, the key events and blob metadata used across the process, and important operational notes.

## Containers

Containers are described in Terraform in [data.tf](https://github.com/ssc-sp/datahub-resource-modules/blob/sw/v6.2-databricks-uc/modules/azure-storage-blob/data.tf)

- `datahub-stage` is the upload staging container where files are scanned
- `datahub` is the shared container used for external file exchange

## Metadata Result on Scan Completion

- `avscan`: `ok`
  - Scan is successful
- `avscan`: `fail`
  - Issue has been found by ClamAV
  - `avscan_reason`: `<details of the threat>`
    - Details of the issue. This should be recorded for FSDH team to understand and identify false positives

## Folder structure

This section is the naming reference for other documents in this folder.


### Pre-scanning

- `datahub-stage`
  - `<user name>`
    - dataset1.csv
  - `john_doe`
    - dataset2.csv
  
### After scan and file copy

In `datahub`, the `shared` folder is used for files shared with external users.

- `datahub`
  - `shared`
    - `<user name>`
      - dataset1.csv
    - `john_doe`
      - dataset2.csv
  
## Copy function

The copy function is in the `datahub-images` repository:
[scan_blob.py](https://github.com/ssc-sp/datahub-images/blob/main/managed-containers/clamav-blobavscan/app/scan_blob.py)

### How it works

`scan_blob.py` performs scanning and post-scan actions on blobs in the staging container.

**Trigger — metadata changes in `datahub-stage`**

Flows are triggered when blob metadata changes in `datahub-stage`, specifically when the scanner writes `avscan` metadata (for example `avscan=ok` or `avscan=fail`). The portal/workflow reads the updated metadata and executes clean, infected, or error handling.

**Chunk-based scanning**

Large files are downloaded and scanned in 1 GB chunks. Each chunk is written to a temporary file and passed to ClamAV via a Unix socket (`pyclamd.ClamdUnixSocket()`). Scanning stops early if a threat is found in any chunk.

**Clean result**

The blob metadata is updated with `avscan=ok`, leaving the file in place for the portal or a downstream copy step to make it accessible.

**Infected result**

1. If `ENABLE_QUARANTINE=true`, the blob is copied to the quarantine container (`datahub-quarantine`) before the original is deleted.
2. A record is written to the `infectedfiles` Azure Table Storage table containing: original URL, quarantine URL, file size (MB), detected threat names, scan duration, and copy duration.
3. The original blob is deleted from the staging container.

### Configuration (environment variables)

| Variable                    | Default              | Description                                          |
| --------------------------- | -------------------- | ---------------------------------------------------- |
| `storage_connection_string` | _(required)_         | Connection string for the storage account            |
| `container_name`            | `datahub-stage`      | Comma-separated list of containers to scan           |
| `quarantine_container_name` | `datahub-quarantine` | Destination for infected blobs                       |
| `ENABLE_QUARANTINE`         | `false`              | Set to `true` to copy infected blobs before deletion |
| `WORK_DIR`                  | `/datahub-temp`      | Working directory for temporary files                |

## Sequence (No virus detected)

```mermaid
sequenceDiagram
autonumber
participant U as Web Portal User
participant UP as FSDH Portal
participant UC as datahub-stage container (Blob)
participant AV as ClamAV Scanner (Container App trigger)
participant DC as datahub/shared folder (Blob)
participant N as FSDH Portal
participant L as Log Analytics / App Insights

U->>UP: Upload one or multiple files
UP-->>UC: Write blob to datahub-stage/<user name>
UP-->>U: Show "Scanning started" notification
UP-->>L: Log ScanStarted event (correlation, sourceUrl)
UC-->>AV: Trigger on blob created/updated
activate AV
AV->>UC: Open blob for scanning
AV-->>AV: Scan file with ClamAV
AV->>UC: Set metadata avscan=ok
AV-->>L: Log scan event (status=Clean)
deactivate AV
UC-->>N: Trigger on metadata changed (avscan=ok)
activate N
N->>UC: Read source blob and scan metadata
N->>DC: Copy blob to shared folder for external access
DC-->>N: Trigger notification
N-->>L: Log copy result (destinationUrl)
N-->>U: Notify success (portal/email)
N-->>L: Log notification result (success)
deactivate N
```

## Sequence (Infected or Error)

```mermaid
sequenceDiagram
autonumber
participant U as Uploader (Client)
participant UC as datahub-stage container (Blob)
participant AV as ClamAV Scanner (Container App trigger)
participant DC as datahub/shared folder (Blob)
participant N as FSDH Portal
participant L as Log Analytics / App Insights

U->>UC: PUT blob (file)
UC-->>U: Show "Scanning started" notification
UC-->>L: Log ScanStarted event (correlation, sourceUrl)
UC-->>AV: Trigger on blob created/updated
AV->>UC: Download blob for scanning
AV-->>AV: Scan file with ClamAV
alt Virus found
  AV->>UC: Set metadata avscan=fail, avscan_reason=signature
  AV-->>L: Log scan event (status=Infected, signature)
  UC-->>N: Trigger on metadata changed (avscan=fail)
  N--x DC: Do not copy to data storage
  N-->>U: Trigger failure notification
  N-->>L: Log blocked copy (infected)
else Scan error
  AV->>UC: Set metadata avscan=fail, avscan_reason=scan_error
  UC-->>N: Trigger on metadata changed (avscan=fail)
  N-->>U: Trigger error notification
  AV-->>L: Log scan event (status=Error, reason)
  N-->>L: Log blocked copy (error)
end
N-->>L: Log notification result (failure)
```

## Notifications

- Notifications are coordinated by a new function in `Datahub.Functions` that monitors blob metadata updates after scanning completes
- The function uses the existing service bus integration to notify the FSDH portal when a file has been processed successfully or has failed scanning
- The portal already has a service principal with read/write access to the workspace storage container
- Required notifications are detailed in [requirements document](./requirements.md#notifications)
  
```mermaid
sequenceDiagram
autonumber
participant S as datahub-stage container (Blob metadata)
participant P as FSDH Portal
participant E as EmailNotificationHandler

S-->>P: Metadata changed (avscan, avscan_reason)
P->>S: Read metadata and blob context
P->>E: Send notification payload (status, file, user)
E-->>P: Acknowledge delivery request
```

### Notification workflow through Datahub.Functions

```mermaid
sequenceDiagram
autonumber
participant S as datahub-stage container (Blob metadata)
participant F as Datahub.Functions
participant SB as Existing Service Bus
participant P as FSDH Portal
participant E as EmailNotificationHandler

S-->>F: Metadata changed (avscan, avscan_reason)
F->>S: Read blob metadata and context
alt Scan completed successfully
  F->>SB: Publish FileProcessed message
  SB-->>P: Deliver processed notification
  P->>E: Send success email notification
  E-->>P: Acknowledge delivery
else Scan failed or infected
  F->>SB: Publish FileFailed message
  SB-->>P: Deliver failure notification
  P->>E: Send failure email notification
  E-->>P: Acknowledge delivery
end
```

> This document was developed with the assistance of generative AI tools to support drafting, diagram generation and structuring activities. No Protected B or sensitive Government of Canada information was entered into these tools. All content has been reviewed, validated, and approved by the author to ensure accuracy, completeness, and compliance with Government of Canada security policies, standards, and applicable Treasury Board guidance.
