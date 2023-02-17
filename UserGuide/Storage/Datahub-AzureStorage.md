# Working with Azure Storage

## What is Azure Storage

The Federal Science DataHub uses Azure Storage, Microsoft's cloud storage solution for modern data storage scenarios. Azure Storage offers highly available, massively scalable, durable, and secure storage for a variety of data objects in the cloud. 

There are two key types of storage accounts:

- **Azure Data Lake Storage (Gen2)** - designed for big data analytics and provides Access Control Lists at the file and folder level
- **Azure Blob Storage** - basic storage account - doesn't provide Access Control at the file and folder level but is required for compatibility in certain scenarios.

## How to copy files to Azure

You have the option to use the browser interface or command line interface (CLI) options to upload/download.

**Datahub Storage Explorer** is the simple method for working with Azure Storage accounts. The storage explorer provides a drag and drop interface and is accessible from the Workspace page. The tool enables users to upload and download files.

## Automated upload and large files

AzCopy is the recommended option for working with large files and the tool can also be integrated into scripts. The tool is available for Windows and Linux. See [AzCopy for copying files from/to Azure Storage](Use-AzCopy-to-Interact-with-Azure-Storage-Account) for additional details.

## Video Tutorial

A [DataHub Video Tutorial - AzCopy focus](https://dhdemosand.blob.core.windows.net/datahub/Data%20Sharing%20Tutorial.mp4?sv=2020-10-02&st=2022-02-09T20%3A22%3A12Z&se=2023-02-10T20%3A22%3A00Z&sr=b&sp=r&sig=OeNPrxbhVMshileL39VKre%2FQBBYfUae5gz1M%2Fsyo3JY%3D) has been created to walk users through the steps to upload files using **AzCopy**.
