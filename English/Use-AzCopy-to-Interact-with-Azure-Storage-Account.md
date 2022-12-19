# Use AzCopy to Interact with Azure Storage Account

## Assumptions
- Familarity with command line (e.g. PowerShell, Linux Shell scripting)
- For command line interaction onl. Users may choose to use Azure Storage Explorer and DataHub Portal Storage Explorer as alternatives if not using command line

## Prerequisites
- Download AzCopy from [Azure](https://aka.ms/downloadazcopy-v10-windows) (no installation required)
- Generate SAS token in Azure or in DataHub Portal

## Folder Initial Sync from Local
- In the line below, change ```C:\mydata\stage``` to your local directory where the data is located.
- Run AzCopy to sync data from local PC or network drive to Azure ```azcopy sync C:\mydata\stage "<sas_uri>"```

## Folder Sync Deleting Missing Files in Azure
- In the line below, change ```C:\mydata\stage``` to your local directory where the data is located.
- Add *--delete-destination* option to delete files if they have been deleted in the source. ```azcopy sync C:\mydata\stage "<sas_uri>" --delete-destination```

## Download
- In the line below, change ```C:\mydata\stage``` to your local directory where the data will be downloaded.
- Download all files from Azure to local (costs apply) ```azcopy cp "<sas_uri>" C:\mydata\stage```
