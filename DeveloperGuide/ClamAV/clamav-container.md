---
title: FSDH Antivirus (ClamAV) Workflow
description: End‑to‑end flow for virus scanning uploaded files with ClamAV, copy to the data storage container, and user notification.
---

## FSDH AV Staging Workflow with container

This page documents the virus scanning workflow for FSDH. It explains the actors, the sequence of operations, the key events and blob metadata used across the process, and important operational notes.

## Goals

- Ensure all uploaded files are scanned before becoming accessible or downloadable.
- Isolate upload from data storage using separate containers and event-driven triggers.
- Provide clear events for downstream copy and user notification.
- Notify the user immediately after upload that scanning is in progress.

## Assumptions

- Dedicated upload storage containers are created during workspace deployment.
  - Legacy workspaces will not allow for external uploads
- Upload tools (for example, `azcopy`) target the upload container only
- No tokens are issued for the data storage container; files appear there only after a clean scan and copy.
- Files are not accessible or downloadable until the scan is complete and status is Clean.
- Azure Container Apps listens for blob created/updated events and kicks off the scan automatically

## Sequence (No virus detected)

```mermaid
sequenceDiagram
autonumber
participant U as Web Portal User
participant UP as Web Portal Upload
participant UC as Upload Container (Blob)
participant AV as ClamAV Scanner (Container App trigger)
participant CF as Copy Function/Service
participant DC as Data Storage Container (Blob)
participant N as Notification Service
participant L as Log Analytics / App Insights

U->>UP: Upload one or multiple files
UP-->>UC: Write blob to uploads container
UP-->>U: Show "Scanning started" notification
UP-->>L: Log ScanQueued event (correlation, sourceUrl)
UC-->>AV: Trigger on blob created/updated
activate AV
AV->>UC: Open blob for scanning
AV-->>AV: Scan file with ClamAV
AV-->>CF: Emit result: status=Clean, correlation
AV-->>L: Log scan event (status=Clean)
deactivate AV
activate CF
CF->>UC: Read source blob
CF->>DC: Copy blob from uploads to data container
CF-->>N: Trigger notification
CF-->>L: Log copy result (destinationUrl)
deactivate CF
N-->>U: Notify success (portal/email)
N-->>L: Log notification result (success)
```

## Sequence (Infected or Error)

```mermaid
sequenceDiagram
autonumber
participant U as Uploader (Client)
participant UC as Upload Container (Blob)
participant AV as ClamAV Scanner (Container App trigger)
participant CF as Data Copy/Result Handler
participant DC as Data Storage Container (Blob)
participant N as Notification Service
participant L as Log Analytics / App Insights

U->>UC: PUT blob (file)
UC-->>U: Show "Scanning started" notification
UC-->>L: Log ScanQueued event (correlation, sourceUrl)
UC-->>AV: Trigger on blob created/updated
AV->>UC: Download blob for scanning
AV-->>AV: Scan file with ClamAV
alt Virus found
  AV-->>CF: result: status=Infected, signature
  AV-->>L: Log scan event (status=Infected, signature)
  CF--x DC: Do not copy to data storage
  CF-->>N: Trigger failure notification
  CF-->>L: Log blocked copy (infected)
else Scan error
  AV-->>CF: result: status=Error, reason
  CF-->>N: Trigger error notification
  AV-->>L: Log scan event (status=Error, reason)
  CF-->>L: Log blocked copy (error)
end
N-->>U: Notify failure (portal/email)
N-->>L: Log notification result (failure)
```
