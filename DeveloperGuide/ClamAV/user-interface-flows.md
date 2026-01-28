# User Interface Flows

## Overview

This document outlines the user interface changes and flows introduced to support ClamAV virus scanning for files uploaded by external users into workspace storage accounts. The integration of virus scanning capabilities has necessitated several UI modifications to ensure users receive appropriate feedback during the upload process and understand the status of their files. Throughout this document, "users" refers to external (non-GC) users authenticated to the FSDH portal, while Government of Canada personnel are referred to as "GoC users".

## Purpose

The primary goals of these UI changes are to:

- **Limit user access**: Users should be limited to a single container within the workspace storage account
- **Provide transparency**: Users should be informed that their files are being scanned for viruses
- **Communicate status**: Clear feedback on whether files are pending scan, currently being scanned, clean, or in error
- **Isolate users**: Users who have uploaded infected files need to be redirected to a static page with details on how to unlock their accounts
- **Locked user tracking**: Allow workspace owners to view locked out users and submit unlocking requests to FSDH admins
- **Update FSDH admin portal**: FSDH admins should be able to review and log scan evidence, unlock users, and allow them back into the FSDH portal
- **Disable AZCopy for External Users**: All features that allow for bulk uploads should be hidden from external users

## UI Changes

### Workspace Storage Account

Currently, the page displays a dropdown at the top with a list of storage accounts and then containers. For GoC users, this logic will be moved into a Windows Explorer-style model instead of a dropdown navigation. When external users access the page, they will only see their designated folder, preventing them from viewing other workspace contents. If GoC users want to share data with external users, they can do so via the external-user folder. In the image at the top of the page, the current container selection needs to be represented as a higher level in the folder hierarchy shown. Additionally, external users will not be able to see the AZCopy, Databricks Access, or DataHub Uploader tabs, limiting them to the File Explorer interface only.

### Implementation Breakdown

The following sections detail the specific UI changes required, broken down by user role and intended functionality.

#### 1. Limit Access for External Users in Storage Explorer

To ensure security and proper workflow for external users, several restrictions will be applied to the Storage Explorer interface:

- **Hide Container Selection**: The container dropdown menu at the top of the page will be hidden to prevent navigation outside authorized areas.
- **Hide Advanced Tabs**: Tabs for AZCopy, Databricks Access, and Datahub Uploader will be removed from the view for external users.
- **Restricted Container View**: The view of containers will be strictly limited for external users.
- **Scan Results Column**: A new column displaying 'scan result' will be added to the file list view within the external-users container.

#### 2. FSDH Admin View for Locked Out Users

A new administrative interface will be created to allow FSDH admins to manage users who have been locked out:

- **Locked User Dashboard**: A dedicated admin page featuring a table of all currently locked-out users.
- **Unlock Capability**: Functionality for admins to verify submitted evidence and unlock user accounts.
- **Notification System**: Automated notifications will be sent to both the user and the workspace admin once access has been re-granted.

#### 3. Workspace Admin Management

Workspace administrators will be empowered to assist in the resolution process:

- **Management View**: A dedicated view will be provided for workspace admins to manage external users.
- **Evidence Submission**: Admins will be able to submit evidence to facilitate the unlocking of locked-out users.

