# Antivirus scanning for non‑managed devices

Uploading from non‑managed computers is a common malware entry point. To protect workspaces, every file must land in a staging area, be scanned by ClamAV, and only then become accessible either e or move into workspace storage.

## Objectives

- Block access to newly uploaded files until they are scanned Clean.
- Prevent malware from entering data containers via external uploads.

## Staging area 

- **Container‑isolated staging and copy** — external user files are uploaded to `datahub-staging/<user name>` and become available in `shared` after a Clean result. See: [FSDH AV Staging Workflow with container](./clamav-container.md).

## Documents in this section

**[Requirements](./requirements.md)** — Formal technical requirements for the end-to-end ClamAV workflow covering file scanning, storage copy, and user notification.

**[FSDH AV Staging Workflow with Container](./clamav-container.md)** — End-to-end flow for virus scanning uploaded files with ClamAV, copying to the data storage container, and user notification.

**[User Interface Flows](./user-interface-flows.md)** — UI changes and flows introduced to support ClamAV scanning, including file status feedback for external users.

## Archive

**[ACL-gated Access for External Users](./clamav-ACLs.md)** — Alternate workflow using ADLS Gen2 ACLs to block user access to files until they are scanned clean.
