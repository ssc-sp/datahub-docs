# Migrating or Offboarding Your Storage

This document provides instructions about:

* migrating your storage from the proof-of-concept (PoC) environment to your new FSDH workspace in the production (prod) environment
* offboarding your storage from PoC should you not be shifting your research to prod

__Please note: Active analysis and experimentation in PoC can continue until Oct. 31, 2025. All databases, storage, web apps, and Databricks resources must be migrated or offboarded from PoC by Nov. 30, 2025.__

## A. Migrating from PoC to prod

To migrate your storage, you must have a new workspace in prod. Once we launch at the end of June, you can proceed with the workspace intake process through the <a href="https://hosting-services-hebergement.canada.ca/s/gc-cloud-fa-catalogue?language=en_US" target="_blank">GC Hosting Services Portal</a>. Guidance is available on the <a href="https://gcxgce.sharepoint.com/teams/10002160" target="_blank">FSDH GCXchange site</a> and [FSDH product guide](https://gcxgce.sharepoint.com/:p:/t/10002160/ERGOIa1qBxFListkKG_0vXkBbJdvvBAMvOnUATGmzd2uuQ?download=1). 

Once your workspace has been provisioned in prod, the Federal Science DataHub support team can assist you with migrating your storage. Please submit a Support Request to get started.

Alternatively, you can migrate your storage yourself using any of the options outlined below.

### Option 1: Use AzCopy to Migrate Storage Directly to Prod

To migrate your storage from PoC to prod, you can use the AzCopy tool to copy your data from the PoC storage account to the prod storage account.

> **Note:** You must have your workspace storage provisioned in prod before you can migrate your data.

You must have AzCopy installed on your local machine to use this approach, you must also sign in with the same account that you use for the Federal Science DataHub.

1. Obtain the SAS URL for PoC by navigating to Storage, clicking the AzCopy tab, and then "Generate Container Token". The URL is displayed in various `azcopy` commands on that page, copy it and save it for future use.

2. Obtain the SAS URL for prod by navigating to Storage, clicking the AzCopy tab, and then "Generate Container Token". The URL is displayed in various `azcopy` commands on that page, copy it and save it for future use.

3. Run the following AzCopy command to copy the data from the PoC storage account to the prod storage account. Replace `<PoC_SAS_URL>` and `<prod_SAS_URL>` with the SAS URLs obtained in the previous steps:

```bash
azcopy copy "<PoC_SAS_URL>" "<prod_SAS_URL>" --recursive
```

4. Validate that the data has been copied successfully by checking the prod storage account.

### Option 2: Use AzCopy to Download Data Locally

To download your data from the PoC storage account to your local machine, you can use the AzCopy tool to copy your data from the PoC storage account to your local machine.

You must have AzCopy installed on your local machine to use this approach, you must also sign in with the same account that you use for the Federal Science DataHub.

1. Obtain the SAS URL for PoC by navigating to Storage, clicking the AzCopy tab, and then "Generate Container Token". The URL is displayed in various `azcopy` commands on that page, copy it and save it for future use.

2. Run the following AzCopy command to copy the data from the PoC storage account to your local machine. Replace `<PoC_SAS_URL>` with the SAS URL obtained in the previous step and `<LOCAL_PATH>` with the path to the local directory where you want to save the data:

```bash
azcopy copy "<PoC_SAS_URL>" "<LOCAL_PATH>" --recursive
```

3. Validate that the data has been copied successfully by checking the local path.

### Option 3: Manually Export Data

If you are unable to use AzCopy to migrate your data, you can manually export your data from the PoC storage account and import it into the prod storage account by simply downloading the data from PoC storage.

## B. Offboarding Storage

If you are not moving to prod, you can use Option 2 or 3 above to download your storage for future use or for archival purposes.

## C. Support

If you encounter any issues during the migration process, please contact the Federal Science DataHub support team by submitting a Support Request. Our team is happy to assist with migration or offboarding your storage.
