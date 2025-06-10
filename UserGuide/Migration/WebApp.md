# Migrating or Offboarding Your Web Apps

This document provides instructions about:

*	migrating your web apps from the proof-of-concept (PoC) environment to your new FSDH workspace in the production (prod) environment
*	offboarding your web apps from PoC should you not be shifting your research to prod

__Please note: Active analysis and experimentation in PoC can continue until Oct. 31, 2025. All databases, storage, web apps, and Databricks resources must be migrated or offboarded from PoC by Nov. 30, 2025.__

## A. Migrating from PoC to Prod

To migrate your web apps, you must have a new workspace in prod. Once we launch at the end of June, you can proceed with the workspace intake process through the <a href="https://hosting-services-hebergement.canada.ca/s/gc-cloud-fa-catalogue?language=en_US" target="_blank">GC Hosting Services Portal</a>. Guidance is available on the <a href="https://gcxgce.sharepoint.com/teams/10002160" target="_blank">FSDH GCXchange site</a> and [FSDH product guide](https://gcxgce.sharepoint.com/:p:/t/10002160/ERGOIa1qBxFListkKG_0vXkBbJdvvBAMvOnUATGmzd2uuQ?download=1). 

To migrate your web apps from PoC to prod, you can simply redeploy your web app in prod using your existing `docker-compose.yml` file stored in your Git repository. Please stop your web app in PoC once you have successfully deployed it in prod.

**NOTE:** You may need to update your images or `docker-compose.yml` file, especially if you use any configurations specific to PoC, such as PostgreSQL connection strings or Databricks connection strings.

## B. Offboarding from PoC

To offboard your web apps from PoC, you can simply stop your web app in the FSDH portal. The app can then be redeployed on a different platform or environment using your images.

## C. Support

If you encounter any issues during the migration process, please contact the Federal Science DataHub support team by submitting a Support Request. Our team is happy to assist with migration or offboarding your web app.
