# Migrating or Offobarding Your Web Apps

This document provides instructions about:

*	migrating your web apps from the proof-of-concept (POC) environment to your new FSDH workspace in the production (PROD) environment
*	offboarding your web apps from the POC environment should you not be shifting your research to the PROD environment

Please note: to avoid data loss, you must complete migration or offboarding by March 31, 2025.

## A. Migrating from POC to PROD

In order to migrate your web apps, you must have a new workspace in the PROD environment. For guidance on setting up your workspace please refer to [URL] or reach out to the Federal Science DataHub support team.

To migrate your web apps from the POC environment to the PROD environment, you can simply redeploy your web app in PROD using your existing `docker-compose.yml` file stored in your Git repository. Please stop your web app in the POC environment once you have successfully deployed it in the PROD environment.

**NOTE:** You may need to update your images or `docker-compose.yml` file, especially if you use any configurations specific to the POC environment, such as PostgreSQL connection strings or Databricks connection strings.

## B. Offboarding from POC

To offboard your web apps from the POC environment, you can simply stop your web app in the FSDH portal. The app can then be redeployed on a different platform or environment using your images.

## C. Support

If you encounter any issues during the migration process, please contact the Federal Science DataHub support team by submitting a Support Request. Our team is happy to assist with migration or offboarding your web app.
