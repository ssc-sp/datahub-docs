# Use AzCopy to Interact with Azure Storage Account

## Useful commands

Here are some sample lines to interact with a workspace. In these sample lines, change `C:\mydata\stage` with the path of the folder or file of interest. For a complete guide on AzCopy utilization, see below.

Copy from local to Azure (upload a file or folder):

`azcopy copy C:\mydata\stage "<sas_uri>"`

Copy from Azure to local (download a file or folder):

`azcopy copy "<sas_uri>" C:\mydata\stage`

Recursively sync from local to Azure (mirror a folder your system to Azure):

`azcopy sync C:\mydata\stage "<sas_uri>" --recursive`

Recursively sync from Azure to local (mirror a folder in Azure to your system):

`azcopy sync "<sas_uri>" C:\mydata\stage --recursive`

## Useful flags

You can add flags at the end of a command to change the behavior of AzCopy. Here are some useful ones:

- `--recursive`: copy or sync all files and folders in the source folder. Without this flag, only the files and folders at the root of the source folder will be copied or synced.
- `--delete-destination`: delete files in the destination folder if they have been deleted in the source folder. This flag is only available for the `sync` command.
- `--overwrite=ifSourceNewer`: overwrite files in the destination folder if they are older than the source files. This flag is only available for the `sync` command.

For more information on the flags that can be used on any command, run `azcopy <command> --help`.

# AzCopy Guide

<video width="720" height="405" controls>
    <source src="/api/media/azcopy.mp4" type="video/mp4">
    Your browser does not support the video tag.
</video>

## Pre-requisites

- Familarity with command line (e.g. PowerShell, Linux Shell scripting)
- For command line interaction only. Users may choose to use Azure Storage Explorer and DataHub Portal Storage Explorer as alternatives if not using command line

## Installation

In order to use AzCopy, you need to install it on your system. You can download the latest version of AzCopy [here](https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10#download-azcopy). For Windows machines, a zip file will be downloaded. Extract the content of the zip file to a folder of your choice. For Linux machines, a tar file will be downloaded. See the documention for your Linux distribution to learn how to extract the content of the tar file.

## Using AzCopy

On Windows, the installation process will leave you with an executable file. In order to use AzCopy, you need to open a command prompt and navigate to the folder where you executable is located. You can then run AzCopy commands as such:

```
azcopy <command> <arguments> <--flags>
```

Here are some of the more useful commands:

- **Copy**

  ```
  azcopy copy <source> <destination> <--flags>
  ```

  This command will copy the source file/folder to the destination. When copying a folder, to ensure a deep copy is done, use the `--recursive` flag.

- **Sync**
  ```
  azcopy sync <source> <destination> <--flags>
  ```
  This command will mirror the source file or folder to the destination file or folder. In order to make a deep copy of your source, use the `--recursive` flag.
- **Remove**
  ```
  azcopy remove <source> <--flags>
  ```
  This command will delete the source file or folder. In order to delete a folder, use the `--recursive` flag.
- **List**
  ```
  azcopy list <source> <--flags>
  ```
  This command will list the files and folders in the source folder. In order to list the files and folders in a folder, use the `--recursive` flag.

When working with these commands, the SAS token generated will point to the root of your workspace and will look similar to this:

```
"https://fsdhprojdw1poc.blob.core.windows.net/datahub?token-info"
```

In order to point to a specific folder or file, you can add the path to that file/folder after `datahub`, as such:

```
"https://fsdhprojdw1poc.blob.core.windows.net/datahub/path/to/folder?token-info"
```

**Examples:**

Copying the `sample.csv` file on my machine into the root of my workspace:

`azcopy copy C:\mydata\sample.csv "<sas_uri>"`

Copying a `sample` folder on my machine into the root of my workspace:

`azcopy copy C:\mydata\sample "<sas_uri>" --recursive`

Syncing the `sample` folder on my machine into a specific folder of my workspace:

`azcopy sync C:\mydata\sample "blob-name.blob.core windows.net/datahub/path/to/folder?token-info" --recursive`

## Learn more

You can read more on AzCopy, including examples scenarios involving Azure storage but also Amazon S3 buckets or Google cloud storage, in the [official documentation](https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10).
