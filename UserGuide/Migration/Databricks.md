# Migrating or Offboarding Your Databricks Resources

This document provides information about:

* migrating your Databricks resources from the proof-of-concept (POC) environment to your new FSDH workspace in the production (PROD) environment
* offboarding your Databricks resources from the POC environment should you not be shifting your research to the PROD environment

Please note: to avoid data loss, you must migrate or offboard your Databricks resources by March 31, 2025.

## A. Migrating from POC to PROD

In order to migrate your Databricks resources, you must have a new workspace in the PROD environment. The FSDH team will provide more information when it becomes available and will provide support as requested.

The Federal Science DataHub support team will assist you with migrating your Databricks resources to your new workspace in the PROD environment. Please submit a Support Request to get started.

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
