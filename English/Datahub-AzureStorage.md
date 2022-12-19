# Working with Azure Storage

## What is Azure Storage

Azure storage provides scalable, secure cloud storage for archival, data, apps and workloads.

There are two key types of storage accounts:

- **Azure Data Lake Storage (Gen2)** - designed for big data analytics and provides Access Control Lists at the file and folder level
- **Azure Blob Storage** - basic storage account - doesn't provide Access Control at the file and folder level but is required for compatibility in certain scenarios.

## How to copy files to Azure

**Datahub Storage Explorer** is the preferred method for working with Azure Storage accounts. The storage explorer provides a drag and drop interface and is accessible from the Data Project page. The tool enables users to upload and download files.

## Automated upload and large files

AzCopy is the recommended option for working with large files and the tool can also be integrated into scripts. The tool is available for Windows and Linux. See [AzCopy for copying files from/to Azure Storage](Use-AzCopy-to-Interact-with-Azure-Storage-Account) for additional details.
