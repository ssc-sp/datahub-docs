# Antivirus scanning for non‑managed devices

Uploading from non‑managed computers is a common malware entry point. To protect workspaces, every file must land in a staging area, be scanned by ClamAV, and only then become accessible either e or move into workspace storage.

**[Requirements](./requirements.md)** — Requirements for the end-to-end ClamAV workflow covering file scanning, storage copy, and user notification.

**[FSDH AV Staging Workflow with Container](./clamav-container.md)** — End-to-end flow for virus scanning uploaded files with ClamAV, copying to the data storage container, and user notification.
