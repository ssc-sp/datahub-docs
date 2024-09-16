# Migrating or Offboarding Your Storage

This document provides instructions about:

* migrating your storage from the proof-of-concept (POC) environment to your new FSDH workspace in the production (PROD) environment
* offboarding your storage from the POC environment should you not be shifting your research to the PROD environment

Please note: to avoid data loss, you must complete migration or offboarding by March 31, 2025.

## A. Migrating from POC to PROD

In order to migrate your storage, you must have a new workspace in the PROD environment. The FSDH team will provide more information when it becomes available and will provide support as requested. 

Once you have a workspace in the PROD environment, the Federal Science DataHub support team can assist you with migrating your storage. Please submit a Support Request to get started.

Alternatively, you can migrate your storage yourself using any of the options outlined below.

### Option 1: Use AzCopy to Migrate Storage Directly to the PROD Environment

To migrate your storage from the POC environment to the PROD environment, you can use the AzCopy tool to copy your data from the POC storage account to the PROD storage account.

> **Note:** You must have your workspace storage provisioned in the PROD environment before you can migrate your data.

You must have AzCopy installed on your local machine to use this approach, you must also sign in with the same account that you use for the Federal Science DataHub.

1. Obtain the SAS URL for POC by navigating to Storage, clicking the AzCopy tab, and then "Generate Container Token". The URL is displayed in various `azcopy` commands on that page, copy it and save it for future use.

2. Obtain the SAS URL for PROD by navigating to Storage, clicking the AzCopy tab, and then "Generate Container Token". The URL is displayed in various `azcopy` commands on that page, copy it and save it for future use.

3. Run the following AzCopy command to copy the data from the POC storage account to the PROD storage account. Replace `<POC_SAS_URL>` and `<PROD_SAS_URL>` with the SAS URLs obtained in the previous steps:

```bash
azcopy copy "<POC_SAS_URL>" "<PROD_SAS_URL>" --recursive
```

4. Validate that the data has been copied successfully by checking the PROD storage account.

### Option 2: Use AzCopy to Download Data Locally

To download your data from the POC storage account to your local machine, you can use the AzCopy tool to copy your data from the POC storage account to your local machine.

You must have AzCopy installed on your local machine to use this approach, you must also sign in with the same account that you use for the Federal Science DataHub.

1. Obtain the SAS URL for POC by navigating to Storage, clicking the AzCopy tab, and then "Generate Container Token". The URL is displayed in various `azcopy` commands on that page, copy it and save it for future use.

2. Run the following AzCopy command to copy the data from the POC storage account to your local machine. Replace `<POC_SAS_URL>` with the SAS URL obtained in the previous step and `<LOCAL_PATH>` with the path to the local directory where you want to save the data:

```bash
azcopy copy "<POC_SAS_URL>" "<LOCAL_PATH>" --recursive
```

3. Validate that the data has been copied successfully by checking the local path.

### Option 3: Manually Export Data

If you are unable to use AzCopy to migrate your data, you can manually export your data from the POC storage account and import it into the PROD storage account by simply downloading the data from the POC storage.

## B. Offboarding Storage

If you are not moving to the PROD environment, you can use Option 2 or 3 above to download your storage for future use or for archival purposes.

## C. Support

If you encounter any issues during the migration process, please contact the Federal Science DataHub support team by submitting a Support Request. Our team is happy to assist with migration or offboarding your storage.
