# Migration and Offboarding Overview

The production environment (prod) of the Federal Science DataHub is expected to launch at the end of June 2025. Once we have a firm date for launch, we will announce it on the platform and email users.

To help prepare you for the transition from PoC to prod, we have created documentation for migrating or offboarding your databases, storage, web apps, and Databricks resources. The content below provides general information about the process and timeline; detailed instructions on specific resources can be found in the sidebar.

## Process and Timeline

__Active analysis and experimentation in PoC can continue until Oct. 31, 2025. All databases, storage, web apps, and Databricks resources must be migrated or offboarded from PoC by Nov. 30, 2025.__

The process and timeline for migrating or offboarding all resources is:

* June 2025:
   * The FSDH team will inform all PoC users of the launch date for prod and communicate with all PoC workspace leads about the process and requirements for opening a workspace in prod. 
* End of June - Oct. 31 2025:
   * Workspaces in PoC will continue to function normally to ensure users can keep working while they transition to prod.
   * Workspace leads who wish to migrate to prod will proceed with the workspace intake process through the <a href="https://hosting-services-hebergement.canada.ca/s/gc-cloud-fa-catalogue?language=en_US" target="_blank">GC Hosting Services Portal</a>. Guidance is available on the <a href="https://gcxgce.sharepoint.com/teams/10002160" target="_blank">FSDH GCXchange site</a> and [FSDH product guide](https://gcxgce.sharepoint.com/:p:/t/10002160/ERGOIa1qBxFListkKG_0vXkBbJdvvBAMvOnUATGmzd2uuQ?download=1).
   *  Once your workspace has been provisioned in prod, you can migrate resources from PoC to prod using the instructions in the sidebar.
   *  If you are not opening a workspace in prod, you can offboard your databases, storage, web apps, and Databricks resources anytime.
* Nov. 1, 2025:
   * All roles in PoC will be set to guest. As a guest, you can continue migrating or offboarding your data and content. All other functionality will be disabled.
* Nov. 30, 2025:
   * Final day to offboard data and content from PoC.
* Dec. 1, 2025:
    * The PoC environment will be disabled for all FSDH users.

## Frequently Asked Questions

### What is the difference between migration and offboarding?

- **Migration:** Moving your resources from the PoC to prod.
- **Offboarding:** Removing your resources from the PoC environment without migrating them to prod.

### Why do I need to migrate or offboard my resources?

Migrating or offboarding your resources ensures that your data and applications are preserved and accessible in the long term. Migrating also allows you to take advantage of the enhanced features and capabilities of prod.

### Who can migrate or offboard resources?

* __Migrating to prod:__
    * Uploading data: Collaborators, administrators and leads can upload data to a workspace in prod to which they have been granted access.
    * Provisioning services: Administrators and leads can provision services within their workspace.
* __Offboarding from the PoC environment:__ All roles in a workspace in the PoC environment, including guests, can offboard resources from that workspace.

### What resources can be migrated or offboarded?

You can migrate all databases, storage and web apps provisioned in the PoC environment. Many Databricks resources including Notebooks, Repositories, Jobs, Secrets, Table ACLs, and ML models can also be migrated.

### What happens if I do not migrate or offboard my resources?

If you do not migrate or offobard your resources by Nov. 30, 2025, they will be lost when the PoC environment is decommissioned. Make sure to migrate or offboard your resources before the deadline to avoid data loss.

### What if I do not have a workspace set up in the prod environment by Nov, 30, 2025?

If you are planning on opening a workspace in prod, we recommend beginning the process as soon as possible so you can migrate before the deadline and ensure your work can continue uninterrupted. If provisioning of your new workspace is in progress but will not be completed before Nov. 30, 2025, please reach out to the Federal Science DataHub team to discuss options.

### How can I get help with migration or offboarding?

If you encounter any issues during the migration or offboarding process, please contact the Federal Science DataHub support team by submitting a Support Request. Our team is happy to assist.
