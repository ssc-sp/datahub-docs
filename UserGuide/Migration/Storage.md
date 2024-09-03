# Storage Migration

This document provides instructions on how to migrate your storage from the proof-of-concept (POC) environment to the production (PROD) environment or to offboard your storage from the POC environment.

## A. Migrate Storage from POC to PROD (Managed by the FSDH team)

If you would like the Federal Science DataHub team to migrate your storage from the POC environment to the PROD environment, please contact the Federal Science DataHub support team by submitting a Support Request. Our team will assist you with migrating your storage to the PROD environment.

## B. Migrate Storage from POC to PROD (Manual with AzCopy)

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

## C. Download Data Locally from POC with AzCopy

To download your data from the POC storage account to your local machine, you can use the AzCopy tool to copy your data from the POC storage account to your local machine.

You must have AzCopy installed on your local machine to use this approach, you must also sign in with the same account that you use for the Federal Science DataHub.

1. Obtain the SAS URL for POC by navigating to Storage, clicking the AzCopy tab, and then "Generate Container Token". The URL is displayed in various `azcopy` commands on that page, copy it and save it for future use.

2. Run the following AzCopy command to copy the data from the POC storage account to your local machine. Replace `<POC_SAS_URL>` with the SAS URL obtained in the previous step and `<LOCAL_PATH>` with the path to the local directory where you want to save the data:

```bash
azcopy copy "<POC_SAS_URL>" "<LOCAL_PATH>" --recursive
```

3. Validate that the data has been copied successfully by checking the local path.

## D. Manually Export Data

If you are unable to use AzCopy to migrate your data, you can manually export your data from the POC storage account and import it into the PROD storage account by simply downloading the data from the POC storage.

## E. Support

If you encounter any issues during the migration process, please contact the Federal Science DataHub support team by submitting a Support Request. Our team is happy to assist with migration or offboarding your storage.