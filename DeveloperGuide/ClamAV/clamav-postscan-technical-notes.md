# Antivirus File Scanning System - Technical Notes

## Prerequisites

- **Azure Storage Account** for the workspace that includes a `triage` container in addition to the main container
- **Azure Storage Tables**: If the file upload record table doesn't exist, it will be created on first use

## File Upload Process

When an external user uploads files:

1. Files are uploaded to the **triage container**
2. For each file in the upload batch, create an `AzureUploadedFileRecord` with the following information:
   - `UploadBatchId`: The upload batch ID from file metadata
   - `TriageContainer` and `TriageFilePath`: Where the file is uploaded before being scanned
   - `TargetContainer` and `TargetFilePath`: Where the file should end up if it is clean
   - `UploadUser`: Email address of the uploading user (also in file metadata)
   - `ScanStatus`: `Unscanned`
3. These records are saved to the storage table "FileUploadRecords" (`AntivirusPostScanHandler.FILE_UPLOAD_RECORD_TABLE_NAME`)

## Post-Scan Process

After virus scan completes for all files in an upload batch, or fails with an error:

1. A **post-scan message** (`AntivirusPostScanMessage`) is posted to the message queue with the following information:
   - `Timestamp`
   - `Result`: `Success`, `Virus`, or `ScanError`
   - `WorkspaceAcronym`
   - `UploadUser`
   - `UploadBatchId`
2. The **post-scan Azure Function** is triggered and processes the files in the upload batch according to the result.

## Post-Scan Azure Function

The post-scan Azure function is defined in `Datahub.Functions.AntivirusPostScanHandler` and has two triggers:
- `AntivirusPostScanQueueHandler` listens to the **"antivirus-post-scan"** (`QueueConstants.AntivirusPostScanQueueName`) message queue on the service bus
- `AntivirusPostScanDebugHttp` is triggered by HTTP POST and is intended for local development and debugging.

Both triggers expect an `AntivirusPostScanMessage` in the body of their request, and pass the deserialized object to `ProcessRequest`. This method dispatches it to a dedicated handler based on the `Result` (`AntivirusScanStatus`) enum:
   - `Success`: Files are moved from triage into the target location
   - `Virus`: Files are deleted from triage; uploading user is locked out; workspace lead and uploading user are notified
   - `ScanError`: Files are deleted from triage
   - Anything else (shouldn't happen): The request is logged without any other operation


## Outstanding Tasks

- [ ] Notification functionality
- [ ] User lockout when a virus is found

---

**Branch**: `ak/clamav_post_scan_function` in the main Datahub repo  
**Last Updated**: January 30, 2026
