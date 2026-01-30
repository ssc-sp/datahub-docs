# Antivirus File Scanning System - Technical Notes

## Prerequisites

- **Azure Storage Account** for the workspace that includes a `triage` container in addition to the main container
- **Azure Storage Tables**: If the file upload record table doesn't exist, it will be created on first use

## File Upload Process

When an external user uploads files:

1. Files are uploaded to the **triage container**
2. For each file in the upload batch, create an `AzureUploadedFileRecord` with the following information:
   - **Upload Batch ID**: The upload batch ID from file metadata
   - **Triage Container & Filepath**: Where the file is uploaded before being scanned
   - **Target Container & Filepath**: Where the file should end up if it is clean
   - **Upload User**: Email address of the uploading user (also in file metadata)
   - **Scan Status**: `Unscanned`
3. These records are saved to the storage table "FileUploadRecords" (`AntivirusPostScanHandler.FILE_UPLOAD_RECORD_TABLE_NAME`)

## Post-Scan Process

After virus scan completes for all files in an upload batch, or fails with an error:

1. A **post-scan message** is posted to the message queue with the following information:
   - `Timestamp`
   - `Result`: `Success`, `Virus`, or `ScanError`
   - `WorkspaceAcronym`
   - `UploadUser`
   - `UploadBatchId`
2. The **post-scan Azure Function** (`Datahub.Functions.AntivirusPostScanHandler`) is triggered and processes the files in the upload batch according to the result

## Outstanding Tasks

- [ ] Notification functionality
- [ ] User lockout when a virus is found

---

**Branch**: `ak/clamav_post_scan_function` in the main Datahub repo 
**Last Updated**: January 30, 2026
