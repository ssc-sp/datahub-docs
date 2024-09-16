# Migration and Offboarding Overview

In fall 2024, the Federal Science DataHub will begin concluding the proof-of-concept (POC) phase and transitioning to the production (PROD) phase.

To prepare you for this transition, we have created a series of guides to help you migrate your databases, storage, web apps, and Databricks resources from the POC environment to the PROD environment or to offboard them from the POC environment.

This document provides general information about the process and timeline. You can find detailed instructions on specific resources in the sidebar.

## Process and Timeline

The process and timeline for migrating or offboarding all resources is:

* Fall 2024:
    * The FSDH team will inform all POC users of the launch date for the PROD environment.
    * The FSDH team will communicate with all POC workspace leads about the process and requirements for opening a workspace in the PROD environment. 
    * Workspace leads who are opening a workspace in the PROD environment may choose to begin the process prior to the launch date. The FSDH team will provide more information when it becomes available and will provide support as requested. 
* Post PROD launch:
    *  Workspace leads who are opening a workspace in the PROD environment but haven't yet started will begin the process. The FSDH team will provide support as requested.
    *  Once you have a workspace in the PROD environment, you can migrate resources from POC to PROD using the instructions in the sidebar.
    *  If you are not opening a workspace in the PROD environment, you can offboard your databases, storage, web apps, and Databricks resources anytime.
* __Feb. 28, 2025: The final day for active analysis and experimentation in the POC environment.__
* Mar. 1, 2025: All user roles converted to 'Guest' to allow for migration and offboarding only.
* __Mar. 31, 2025: All databases, storage, web apps, and Databricks resources must be migrated or offboarded.__
* Apr. 1, 2025: POC decommissioned and all content therein deleted.

## Frequently Asked Questions

### What is the difference between migration and offboarding?

- **Migration:** Moving your resources from the POC environment to the PROD environment.
- **Offboarding:** Removing your resources from the POC environment without migrating them to the PROD environment.

### Why do I need to migrate or offboard my resources?

Migrating or offboarding your resources ensures that your data and applications are preserved and accessible in the long term. Migrating also allows you to take advantage of the enhanced features and capabilities of the PROD environment.

### Who can migrate or offboard resources?

* __Migrating to the PROD environment:__
    * Uploading data: Collaborators, administrators and leads can upload data  to a workspace in the PROD environment to which they have been granted access.
    * Provisioning services: Administrators and leads can provision services within their workspace.
* __Offboarding from the POC environment:__ All roles in a workspace in the POC environment, including guests, can offboard resources from that workspace.

### What resources can be migrated or offboarded?

You can migrate all databases, storage and web apps provisioned in the POC environment. Many Databricks resources including Notebooks, Repositories, Jobs, Secrets, Table ACLs, and ML models can also be migrated.

### What happens if I do not migrate or offboard my resources?

If you do not migrate or offobard your resources by Mar. 31, 2025, they will be lost when the POC environment is decommissioned. Make sure to migrate or offboard your resources before the deadline to avoid data loss.

### What if I do not have a workspace set up in the PROD environment by Mar. 31, 2025?

If you are planning on opening a workspace in the PROD environment, we recommend beginning the process as soon as possible so you can migrate before the deadline and ensure your work can continue uninterrupted. If provisioning of your new workspace is in progress but will not be completed before Mar. 31, 2025, please reach out to the Federal Science DataHub team to discuss options.

### How can I get help with migration or offboarding?

If you encounter any issues during the migration or offboarding process, please contact the Federal Science DataHub support team by submitting a Support Request. Our team is happy to assist.
