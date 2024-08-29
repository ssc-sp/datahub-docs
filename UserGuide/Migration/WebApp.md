# Web App Migration Instructions

This document provides instructions on how to migrate your web apps from the proof-of-concept (POC) environment to the production (PROD) environment or to offboard your web apps from the POC environment.

## A. Migrate Web Apps from POC to PROD

To migrate your web apps from the POC environment to the PROD environment, you can simply redeploy your web app in PROD using your existing `docker-compose.yml` file stored in your Git repository. Please stop your web app in the POC environment once you have successfully deployed it in the PROD environment.

**NOTE:** You may need to update your images or `docker-compose.yml` file, especially if you use any configurations specific to the POC environment, such as PostgreSQL connection strings or Databricks connection strings.

## B. Offboard Web Apps from POC

To offboard your web apps from the POC environment, you can simply stop your web app using the FSDH portal. The app can then be redeployed on a different platform or environment using your images.