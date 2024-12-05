# Migration and Offboarding Overview

In December 2024, the Federal Science DataHub will begin the two-part launch of the production (PROD) environment:
* Dec. 6, 2024: soft launch begins, with a small number of FSDH users opening workspaces in the PROD environment and migrating content to their new workspace in PROD.
* March 2025: The FSDH production environment is launched broadly to all science-based departments and agencies.

To prepare you for this transition, we have created a series of guides to help you migrate your databases, storage, web apps, and Databricks resources from the proof-of-concept (POC) environment to the PROD environment, or to offboard them from the POC environment.

This document provides general information about the process and timeline. You can find detailed instructions on specific resources in the sidebar.

## Process and Timeline

__The FSDH team will establish a cutoff date for active analysis and experimentation in the POC environment as well as a final date by which all databases, storage, web apps, and Databricks resources must be migrated or offboarded. Once finalized, these dates will be communicated in this documentation, by general email and via in-platform announcements to ensure all workspace leads are aware of all important deadlines in order to avoid unintended data loss.__

The process and timeline for migrating or offboarding all resources is:

* December 2024-March 2025:
    * Dec. 6, 2024: Soft launch kickoff session with workspace leads who have agreed to participate in the soft launch.
    * Soft launch participants will open workspaces in the production environment and migrate content from existing workspaces in the POC environment to their new workspace in PROD. The FSDH support team will assist as needed.
* February-March 2025:
    * The FSDH team will inform all POC users of the launch date for the PROD environment.
    * The FSDH team will communicate with all POC workspace leads about the process and requirements for opening a workspace in the PROD environment. 
    <!--* Workspace leads who are opening a workspace in the PROD environment may choose to begin the process prior to the launch date. The FSDH team will provide more information when it becomes available and will provide support as requested.--> 
* March 2025 onward:
    *  Workspace leads who wish to migrate to the PROD environment will open a new workspace in PROD. The FSDH team will provide support as requested.
    *  Once you have a workspace in the PROD environment, you can migrate resources from POC to PROD using the instructions in the sidebar.
    *  If you are not opening a workspace in the PROD environment, you can offboard your databases, storage, web apps, and Databricks resources anytime.

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

<!--### What if I do not have a workspace set up in the PROD environment by Mar. 31, 2025?

If you are planning on opening a workspace in the PROD environment, we recommend beginning the process as soon as possible so you can migrate before the deadline and ensure your work can continue uninterrupted. If provisioning of your new workspace is in progress but will not be completed before Mar. 31, 2025, please reach out to the Federal Science DataHub team to discuss options.-->

### How can I get help with migration or offboarding?

If you encounter any issues during the migration or offboarding process, please contact the Federal Science DataHub support team by submitting a Support Request. Our team is happy to assist.
