# FSDH ClamAV Notifcations

## ClamAV and GC Docs interactions

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

