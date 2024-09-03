# Databricks Migration Instructions

This document provides instructions on how to migrate your Databricks workspaces from the proof-of-concept (POC) environment to the production (PROD) environment or to offboard your Databricks work from the POC environment.

## A. Migrate Databricks from POC to PROD

To migrate your Databricks work from the POC environment to the PROD environment, please contact the Federal Science DataHub support team by submitting a Support Request. Our team will assist you with migrating your Databricks workspaces to the PROD environment.

Please note, only the following Databricks resources can be migrated from the POC environment to the PROD environment:

* Notebooks
* Repositories
* Jobs
* Secrets
* Table ACLs
* ML Models

For more information on migrating Databricks resources, please refer to the [Databricks Migration Tool documentation](https://github.com/databrickslabs/migrate).

## B. Offboard Databricks from POC

To offboard your Databricks work from the POC environment, the best approach is to export your Databricks resources (e.g., notebooks, repositories, etc) and import them into your local environment or another Databricks workspace.