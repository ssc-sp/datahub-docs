# Migrating or Offboarding Your Databricks Resources

This document provides instructions for:

* migrating your Databricks resources from the proof-of-concept (POC) environment to your new FSDH workspace in the production (PROD) environment
* offboarding your Databricks resources from the POC environment should you not be shifting your research to the PROD environment

## A. Migrating from POC to PROD

The Federal Science DataHub support team will assist you with migrating your Databricks resources to your new workspace in the the PROD environment. Please submit a Support Request to get started.

Please note, only the following Databricks resources can be migrated from the POC environment to the PROD environment: 

//What resources cannot be migrated?
//What actions can people take for the resources that cannot be migrated?

* Notebooks
* Repositories
* Jobs
* Secrets
* Table ACLs
* ML models

For more information on migrating Databricks resources, please refer to the [Databricks Migration Tool documentation](https://github.com/databrickslabs/migrate).
//If the FSDH team is assisting with migration, why would people need this link?

## B. Offboarding from POC

If you are not opening a workspace in the PROD environment, you may want to export your Databricks resources (e.g., notebooks, repositories, etc) from the POC environment and import them into your local environment or another Databricks workspace.

//Is there a deadline for exporting?
//Are there instructions on how to export?
