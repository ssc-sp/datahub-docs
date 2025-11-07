---
title: FSDH Antivirus (ClamAV) — ACL‑gated Access
description: Alternate workflow that uses ADLS Gen2 ACLs (Azure Storage v2 with hierarchical namespace enabled) to block user access to files until they are scanned clean.
---

## FSDH AV Staging Workflow with ACLs

This page describes the antivirus workflow variant that relies on ADLS Gen2 ACLs (Azure Storage v2 with hierarchical namespace enabled) to gate access. Users can upload files, but cannot read or download them until a scan marks them Clean. No copy to a separate data container is required; access is enabled by updating ACLs on the uploaded blob within a single folder. Azure Container Apps listens for blob created/updated events and kicks off the scan automatically.

## Goals

- Ensure all uploaded files are scanned before becoming accessible or downloadable.
- Gate read access using ACLs instead of copying files between containers.
- Container Apps is triggered directly by new/updated blobs
- Provide clear events for scan result and user notification.
- Notify the user immediately for scan events

## Assumptions

- A single ADLS Gen2 filesystem (container) is used
- A folder called `external-uploads/` is used by the web portal to let external users upload files
- Read access in `external-uploads/` is granted only after the scan returns Clean by updating the blob ACL to include a readers group with `r--`.
- Files are not accessible or downloadable until the scan is complete and status is Clean.
- `Storage Service` features will be added to existing Function project in `Datahub.Functions`

## Sequence (Clean result — enable access)

```mermaid
sequenceDiagram
autonumber
participant WL as Workspace Lead
participant U as External User
participant UC as FSDH Web Storage Explorer
participant FS as ADLS Gen2 Filesystem (external-uploads/)
participant AV as ClamAV Scanner (Container App)
participant AS as Storage Service (Function)
participant L as Log Analytics / App Insights

U-->>UC: Upload one or multiple files (HTTPS)
UC-->>FS: Write blob to external-uploads/ (no read access) (HTTPS)
UC-->>WL: Notify upload (external activity logs)
UC-->>U: Show "Scanning started" notification
FS-->>AV: Trigger on blob created/updated
activate AV
AV-->>L: Log ScanQueued event (correlation, blobUrl)
AV->>FS: Open blob from external-uploads/ for scanning
AV-->>AV: Scan file with ClamAV
AV-->>AS: Emit result: status=Clean, correlation
AV-->>L: Log scan event (status, engine, timings)
deactivate AV
activate AS
AS->>FS: Set ACL on blob to grant readers r--
AS-->>L: Log access-enabled event (blob, ACL, correlation)
deactivate AS
AS-->>U: Notify success (portal banner)
AS-->>WL: Notify success (external activity logs)
```

## Sequence (Infected or Error — keep blocked)

```mermaid
sequenceDiagram
autonumber
participant WL as Workspace Lead
participant U as External User
participant UC as FSDH Web Storage Explorer
participant FS as ADLS Gen2 Filesystem (external-uploads/)
participant AV as ClamAV Scanner (Container App trigger)
participant AS as Storage Service (Function)
participant L as Log Analytics / App Insights

U->>UC: Upload one or multiple files
UC-->>FS: Write blob to external-uploads/ (write-only)
UC-->>WL: Notify upload (external activity logs)
UC-->>U: Show "Scanning started" notification
FS-->>AV: Trigger on blob created/updated
activate AV
AV->>FS: Open blob from external-uploads/ for scanning
AV-->>L: Log ScanQueued event (correlation, blobUrl)
AV-->>AV: Scan file with ClamAV
alt Virus found
  AV-->>AS: result: status=Infected
  AV-->>AV: Delete file
  AV-->>L: Log scan event (status=Infected)
else Scan error
  AV-->>AS: result: status=Error, reason
  AV-->>L: Log scan event (status=Error, reason)
  AS--x U: Do not grant read ACL remains blocked
end
deactivate AV
AS-->>L: Log access-blocked event (status)
AS-->>U: Notify failure (portal/email)
AS-->>WL: Notify failure (external activity logs + email)
```

### Notifications

- Workspace owners receive an email with details (user email, date, virus)
- User receives an email to indicate that one or multiple files were flagged with a virus
- Portal shows badges or alerts (TBD)

## Data Elements

The following tables define a compact, canonical schema for storage-queue messages and blob metadata used across the workflow. Names are suggestions and can be adapted to your environment.

### Scan result event (from ClamAV to Storage Service)

| Key             | Type                             | Description                                                                 |
| --------------- | -------------------------------- | --------------------------------------------------------------------------- |
| status          | enum("Clean","Infected","Error") | Result of scanning.                                                         |
| signature       | string                           | Virus signature when status=Infected.                                       |
| engineVersion   | string                           | ClamAV engine/definitions version used.                                     |
| scanStartedAt   | datetime                         | When scanning began.                                                        |
| scanCompletedAt | datetime                         | When scanning finished.                                                     |
| blobUrl         | string                           | Original blob URL under `external-uploads/`.                                |

### Blob metadata

| Key                | Example                              | Description                                                          |
| ------------------ | ------------------------------------ | -------------------------------------------------------------------- |
| dh:scanStatus      | Clean                                | Clean, Infected, or Error.                                           |
| dh:scanSignature   | Win.Test.EICAR_HDB-1                 | Virus signature when infected.                                       |
| dh:scanEngine      | ClamAV 1.3.0 (defs: 2025‑11‑03)      | Scanner and definitions version.                                     |
| dh:scanStartedAt   | 2025-11-03T15:04:59Z                 | UTC timestamps for auditing.                                         |
| dh:scanCompletedAt | 2025-11-03T15:05:01Z                 |                                                                      |
| dh:sourceContainer | uploads                              | Name of the original container.                                      |
| dh:accessEnabledAt | 2025-11-03T15:05:01Z                 | Timestamp when read access was granted.                              |

## Observability: Log Analytics / Application Insights

Both the ClamAV scanner (Container App) and the Notification Service emit structured telemetry for operations and results. The examples below assume:

- Telemetry is sent to Application Insights connected to a Log Analytics workspace.
- Events are tracked as customEvents with the following names and dimensions:
  - **name:** "ClamAVScan" with customDimensions: correlationId, status, engineVersion, scanStartedAt, scanCompletedAt, durationMs, blobUrl, workspaceId, container, path
  - **name:** "AccessEnabled" or "AccessBlocked" from the Storage Service with customDimensions: correlationId, status, blobUrl
  - **name:** "ScanQueued" emitted by the upload flow with customDimensions: correlationId, blobUrl, fileName, sizeBytes, uploader
