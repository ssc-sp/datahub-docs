---
title: FSDH Antivirus (ClamAV) — External User Access Control and File Scanning
description: Technical requirements for the end-to-end ClamAV workflow within the FSDH portal, covering virus scanning of uploaded files, copying to data storage, and user notification.
---

## FSDH ClamAV Staging Workflow

This document specifies the technical architecture and implementation requirements for the virus scanning workflow within the Federal Science DataHub (FSDH). It defines the system goals, security constraints, required Azure resources, operational sequence, event-driven triggers, and blob metadata schema used across the malware detection pipeline. Throughout this document, "users" refers to external (non-GC) users authenticated to the FSDH portal, while Government of Canada personnel are referred to as "GC users".

## Assumptions

The `ClamAV` containerized antivirus engine is pre-configured with up-to-date malware signatures and deployed within the infrastructure.

- Dedicated upload storage containers are created during workspace deployment.
  - Legacy workspaces will not allow for external uploads
- Upload tools (for example, `azcopy`) target the upload container only
- No tokens are issued for the data storage container; files appear there only after a clean scan and copy.
- Files are not accessible or downloadable until the scan is complete and status is Clean.
- Azure Container Apps listens for blob created/updated events and kicks off the scan automatically
- `datahub-staging` (upload staging) and `datahub` (shared data exchange) containers are created in TF during workspace provisioning; external sharing uses `datahub/shared/<user name>`


## Goals

- **Enforce mandatory malware scanning** for all uploaded files prior to accessibility or download availability.
  - Infected files must be immediately quarantined and deleted from the storage layer
  - Files triggering scan errors must be treated as potentially malicious and deleted (fail-secure approach)
  - Ensure all uploaded files are scanned before becoming accessible or downloadable.
- Execute `ClamAV` within an isolated container runtime environment
- **Implement automatic account lockout** for users uploading infected files
  - Deliver automated email notifications to affected users and workspace owners with scan results and remediation procedures
  - Expose lockout status via portal UI dashboard for workspace administrators
- Provide DataHub administrators with a centralized lockout management interface
  - Require upload of verified system scan evidence from the affected user before access reinstatement
  - Enable administrative override capabilities for access restoration
- **Restrict AZCopy access** for external users
  - Disable SAS token generation for external users while maintaining this capability for GC users
- Update Terms & Conditions to explicitly communicate device security requirements and scanning policies to external users
- Maintain comprehensive audit logs of all file upload events, scan results, and scanning activities for compliance and forensic analysis
- **Implement defenses against AV evasion techniques**:
  - Enforce decompression depth limits and maximum file size constraints to mitigate archive bomb (zip bomb) attacks
  - Detect obfuscation techniques, polyglot files, and dual/misleading file extensions
  - Ensure scanning engine supports deep content inspection within embedded objects (e.g., PDF attachments, OLE objects)
  - Isolate upload from data storage using separate containers and event-driven triggers.
- Establish documented procedures for investigating and resolving false positive detections
- Provide clear events for downstream copy and user notification.
- Notify the user immediately after upload that scanning is in progress.

## Restrictions

- Implement strict MIME type validation to enforce allowlist-based file format restrictions
- Enforce maximum file size limits
- Network segmentation policy: workspace-scoped resources cannot initiate direct connections to core infrastructure resources

## Notifications

Throughout the ClamAV virus scan flow, different parts of the app send notifications to different actors depending on where users are in the process. This document outlines those communications.

### Successful scan notifications

Send an email to the user confirming their file completed the virus scan successfully. No additional action is required by the user.

### Scan error notifications

Notify the user that their file failed to scan and instruct them to try uploading again. If the error persists, the user should contact support through standard channels.

### Virus found notifications

Email the user and workspace admin that the user has been locked out due to a virus found on an uploaded file. The user must run a clean scan of their machine and provide evidence to the workspace admin, who will then work on unlocking the user.

### Workspace admin evidence upload notifications

Notify the FSDH admin that the workspace admin has uploaded evidence of a clean scan so the user can be unlocked.

### User reinstatement notifications

Email the user and workspace admin that the user has been reinstated after the account is unlocked.

## UI Requirements

Currently, the page displays a dropdown at the top with a list of storage accounts and then containers. 

- For GoC users, this logic will be moved into a Windows Explorer-style model instead of a dropdown navigation. 
- When external users access the page, they will only see their designated folder, preventing them from viewing other workspace contents. 
- If GoC users want to share data with external users, they can do so via `datahub/shared/<user name>`. In the image at the top of the page, the current container selection needs to be represented as a higher level in the folder hierarchy shown. Additionally, external users will not be able to see the AZCopy, Databricks Access, or DataHub Uploader tabs, limiting them to the File Explorer interface only. Naming should follow the [Folder structure](./clamav-container.md#folder-structure) section.

### Limit Access for External Users in Storage Explorer

To ensure security and proper workflow for external users, several restrictions will be applied to the Storage Explorer interface:

- **Hide Container Selection**: The container dropdown menu at the top of the page will be hidden to prevent navigation outside authorized areas.
- **Hide Advanced Tabs**: Tabs for AZCopy, Databricks Access, and Datahub Uploader will be removed from the view for external users.
- **Restricted Container View**: The view of containers will be strictly limited for external users.
- **Scan Results Column**: A new column displaying 'scan result' will be added to the file list view within `datahub/shared/<user name>`.

### FSDH Admin View for Locked Out Users

A new administrative interface will be created to allow FSDH admins to manage users who have been locked out:

- **Locked User Dashboard**: A dedicated admin page featuring a table of all currently locked-out users.
- **Unlock Capability**: Functionality for admins to verify submitted evidence and unlock user accounts.
- **Notification System**: Automated notifications will be sent to both the user and the workspace admin once access has been re-granted.

### Workspace Admin Management

Workspace administrators will be empowered to assist in the resolution process:

- **Management View**: A dedicated view will be provided for workspace admins to manage external users.
- **Evidence Submission**: Admins will be able to submit evidence to facilitate the unlocking of locked-out users.



> This document was developed with the assistance of generative AI tools to support drafting, diagram generation and structuring activities. No Protected B or sensitive Government of Canada information was entered into these tools. All content has been reviewed, validated, and approved by the author to ensure accuracy, completeness, and compliance with Government of Canada security policies, standards, and applicable Treasury Board guidance.
