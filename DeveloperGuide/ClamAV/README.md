# Antivirus scanning for non‑managed devices

Uploading from non-managed computers is a common malware entry point. To protect workspaces, every file must land in a staging area, be scanned by ClamAV, and only then become accessible or move into workspace storage.

See [requirements](./requirements.md) for overview.

This page documents the virus scanning workflow for FSDH. It explains the actors, the sequence of operations, the key events (including queue messages) and blob metadata used across the process, and important operational notes.

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

## ClamAV Completion Queue (Azure Storage Queue)

Because function triggers cannot rely on blob metadata changes, scan completion events are sent to an Azure Storage Queue. `Datahub.Functions` consumes this queue as the trigger and then reads blob metadata/context to determine clean, infected, or error handling.

Queue name: `clamav-scan-completion`

Message contract:

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ScanStartTime` | `string` (ISO 8601 UTC) | Yes | Timestamp when ClamAV scan started. |
| `ScanEndTime` | `string` (ISO 8601 UTC) | Yes | Timestamp when ClamAV scan completed. |
| `ScanError` | `string` | Yes | Empty string when scan execution is successful; populated with error details when scan execution fails. |

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

**Trigger — Azure Storage Queue message on scan completion**

After each scan completes, the scanner sends a message to the ClamAV completion Azure Storage Queue with `ScanStartTime`, `ScanEndTime`, and `ScanError`. `Datahub.Functions` is triggered by this queue message and then reads blob metadata (`avscan`, `avscan_reason`) to execute clean, infected, or error handling.

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
participant Q as ClamAV completion queue (Azure Storage Queue)
participant F as Datahub.Functions
participant DC as datahub/shared folder (Blob)
participant SB as Service Bus
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
AV->>Q: Enqueue completion message\n(ScanStartTime, ScanEndTime, ScanError="")
AV-->>L: Log scan event (status=Clean)
deactivate AV
Q-->>F: Trigger on queue message
activate F
F->>UC: Read source blob and scan metadata
F->>DC: Copy blob to shared folder for external access
F-->>L: Log copy result (destinationUrl)
F->>SB: Publish FileProcessed message
deactivate F
SB-->>N: Deliver processed notification
activate N
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
participant Q as ClamAV completion queue (Azure Storage Queue)
participant F as Datahub.Functions
participant DC as datahub/shared folder (Blob)
participant SB as Service Bus
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
  AV->>Q: Enqueue completion message\n(ScanStartTime, ScanEndTime, ScanError="")
  AV-->>L: Log scan event (status=Infected, signature)
  Q-->>F: Trigger on queue message
  F->>UC: Read source blob and scan metadata
  F--x DC: Do not copy to data storage
  F-->>F: Lock account of user
  F->>SB: Publish FileFailed message
  SB-->>N: Deliver failure notification
  N-->>U: Logout user
  N-->>L: Log blocked copy (infected)
else Scan error
  AV->>UC: Set metadata avscan=fail, avscan_reason=scan_error
  AV->>Q: Enqueue completion message\n(ScanStartTime, ScanEndTime, ScanError=error_details)
  Q-->>F: Trigger on queue message
  F->>UC: Read source blob and scan metadata
  F->>SB: Publish FileFailed message
  SB-->>N: Deliver failure notification
  N-->>U: Trigger error notification
  AV-->>L: Log scan event (status=Error, reason)
  N-->>L: Log blocked copy (error)
end
N-->>L: Log notification result (failure)
```

## Notifications

- Notifications are coordinated by a new function in `Datahub.Functions` that monitors ClamAV completion queue messages after scanning completes
- The function calls `EmailNotificationHandler` directly when a file has been processed successfully or when the scan result is not `ok`
- For non-`ok` scan results, the function locks the external user and sends an alert to the workspace owner before sending the failure notification
- Required notifications are detailed in [requirements document](./requirements.md#notifications)

### Service Bus Queues

The virus scanning workflow uses service bus queues to separate scan result handling from user status updates and email delivery. `virus-scan-notification` carries the processed or failed scan result for notification handling, `virus-scan-user-status` carries external-user lock or status changes, and `email-notification` is consumed by `EmailNotificationHandler` for the email delivery step. See [Message Bus Overview](../ServiceBus/README.md) for the queue reference.

### Notification workflow through Datahub.Functions

```mermaid
sequenceDiagram
autonumber
participant Q as ClamAV completion queue (Azure Storage Queue)
participant S as datahub-stage container (Blob)
participant F as Datahub.Functions
participant E as EmailNotificationHandler

Q-->>F: Queue message received (ScanStartTime, ScanEndTime, ScanError)
F->>S: Read blob metadata and context (avscan, avscan_reason)
alt Scan completed successfully
  F->>E: Send success email notification
  E-->>F: Acknowledge delivery
else Scan result is not ok
  F-->>F: Lock external user
  F->>E: Send workspace owner alert
  E-->>F: Acknowledge delivery
  F->>E: Send failure email notification to external user
  E-->>F: Acknowledge delivery
end
```

> This document was developed with the assistance of generative AI tools to support drafting, diagram generation and structuring activities. No Protected B or sensitive Government of Canada information was entered into these tools. All content has been reviewed, validated, and approved by the author to ensure accuracy, completeness, and compliance with Government of Canada security policies, standards, and applicable Treasury Board guidance.
