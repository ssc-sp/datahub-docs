# Antivirus scanning for non‑managed devices

Uploading from non‑managed computers is a common malware entry point. To protect workspaces, every file must land in a staging area, be scanned by ClamAV, and only then become accessible either e or move into workspace storage.

## Objectives

- Block access to newly uploaded files until they are scanned Clean.
- Prevent malware from entering data containers via external uploads.

## Staging area options

- Option 1: **ACL‑gated staging in one container** — upload to an `external-uploads/` folder with write‑only; after a Clean result, read ACLs are granted (no copy). See: [FSDH AV Staging Workflow with ACLs](./clamav-ACLs.md).
  - Preferred option: no data copy required
  - Work started to confirm feasibility and applicability with current setup  
- Option 2: **Container‑isolated staging and copy** — upload to an "uploads" container; after a Clean result, a copy moves the file into the data container. See: [FSDH AV Staging Workflow with container](./clamav-container.md).
  - Alternative option - would require data copy between containers and require more effort to manage errors and timing.

Both patterns ensure files from non‑managed devices are scanned before users can access them; pick the one that best fits your storage and access model.
