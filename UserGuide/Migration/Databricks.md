# Migrating or Offboarding Your Databricks Resources

This document provides information about:

* migrating your Databricks resources from the proof-of-concept (PoC) environment to your new FSDH workspace in the production (prod) environment
* offboarding your Databricks resources from the PoC environment should you not be shifting your research to the prod environment

__Please note: Active analysis and experimentation in PoC can continue until Oct. 31, 2025. All databases, storage, web apps, and Databricks resources must be migrated or offboarded from PoC by Nov. 30, 2025.__

## A. Migrating from PoC to prod

To migrate your Databricks resources, you must have a new workspace in prod. Once we launch at the end of June, you can proceed with the workspace intake process through the <a href="https://hosting-services-hebergement.canada.ca/s/gc-cloud-fa-catalogue?language=en_US" target="_blank">GC Hosting Services Portal</a>. Guidance is available on the <a href="https://gcxgce.sharepoint.com/teams/10002160" target="_blank">FSDH GCXchange site</a> and [FSDH product guide](https://gcxgce.sharepoint.com/:p:/t/10002160/ERGOIa1qBxFListkKG_0vXkBbJdvvBAMvOnUATGmzd2uuQ?download=1).

Once your workspace has been provisioned in prod, you can migrate resources from PoC to prod. The Federal Science DataHub support team will assist you with migrating your Databricks resources to your new workspace in the PROD environment. Please submit a Support Request to get started.

Please note, only the following Databricks resources can be migrated from the POC environment to the PROD environment: 

* Notebooks
* Repositories
* Jobs
* Secrets
* Table ACLs
* ML models

If you have Databricks resources not listed above (e.g., clusters, including custom conda clusters, or mounted storage), they will need to be recreated in your new workspace. Please refer to [Databricks documentation](https://github.com/databrickslabs/migrate) or reach out to the FSDH team for more information.

## B. Offboarding from POC

If you are not opening a workspace in the PROD environment, you may want to export your Databricks resources (e.g., notebooks, repositories, etc.) from the POC environment and import them into your local environment or another Databricks workspace.
