# Access Azure storage account in Databricks

When your Databricks workspace is created for your project, an Azure Storage Account has already been created. DataHub also mounts the Blob storage of the Storage Account with the pre-created Databricks cluster (main_cluster). This mount is for your convenience and access to the Blob data is subject to your identity. At the time of writing, all project members have full access to the Blob storage.

## Assumptions
- Familiarity with file API in Python or R
- Access to Databricks has been granted by Datahub team

## Default DataHub Mount point 

The storage account has been mounted in Databricks to the default cluster (main_cluster) and can be accessed in your Noteobok just like a regular folder.
Mounting storage in Databricks allows you to access objects in object storage as if they were on the local file system.

To access the mount point in the default cluster, consider the sample code below
```
df = spark.read.option("header","true").csv('/mnt/fsdh-dbk-main-mount/sample.csv');
df.show(3);
```
In the above example, the pre-created path `/mnt/fsdh-dbk-main-mount/` points to the `datahub` container of your Blob storage. The file `sample.csv` is for illustration purpose and you must change to your file name.

To access the same pre-created path from R using SparkR, refer to the following sample code.

```
%r

library(SparkR)
sparkR.session()
df <- read.df("dbfs:/mnt/fsdh-dbk-main-mount/sample.csv", source = "csv")
head(df, 3)
```

## Other Ways

As you create more clusters based on DataHub cluster policies, you can mount your project Blob storage in your code.

### Option 1 - SAS Token (Recommended)

In your notebook, simply refer to your storage using the preconfigured Spark configuration `abfss_uri`. Sample code:
```
dbutils.fs.ls(spark.conf.get('abfss_uri'))
```

#### How does this work? 
The SAS token for your storage account has been precreated in Azure Key Vault and referenced in your cluster configuration. The SAS token will be rotated periodically. The cluster configuration looks like the following. These settings apply to clusters created using FSDH cluster policy as well as personal clusters.

  ```
    fs.azure.sas.token.provider.type.yourstorageaccount.dfs.core.windows.net org.apache.hadoop.fs.azurebfs.sas.FixedSASTokenProvider
    fs.azure.account.auth.type.yourstorageaccount.dfs.core.windows.net SAS
    fs.azure.sas.fixed.token.yourstorageaccount.dfs.core.windows.net {{secrets/datahub/container-sas}}
    abfss_uri abfss://datahub@yourstorageaccount.dfs.core.windows.net
  ```
### Option 2 - Mount with Storage Account Key

```
if any(mount.mountPoint == "/mnt/fsdh" for mount in dbutils.fs.mounts()):
         dbutils.fs.unmount("/mnt/fsdh")

dbutils.fs.mount(
   source = "wasbs://datahub@mystorage.blob.core.windows.net",
   mount_point = "/mnt/fsdh",
   extra_configs = {"fs.azure.account.key.mystorage.blob.core.windows.net":dbutils.secrets.get(scope = "datahub", key = "storage-key")})
```
### Option 3 - Mount Blob Container

1. Mount the container

   ```
    configs = {
      "fs.azure.account.auth.type": "CustomAccessToken",
      "fs.azure.account.custom.token.provider.class": spark.conf.get("spark.databricks.passthrough.adls.gen2.tokenProviderClassName")
    }

    dbutils.fs.mount(
       source = "abfss://container@account.dfs.core.windows.net/",
       mount_point = "/mnt/my-mountpoint",
       extra_configs = configs)
   ```
2. Once you have mounted a folder in ```/mnt/my-mountpoint```, the python programs in Databricks can access files in that storage container as if they were local files.
    ```
    df = spark.read.option("header","true").csv('/mnt/my-mountpoint/sample.csv');
    df.show(3);
    ```

### Option 3 - Directly Access Individule Files

You can also directly access files without mounting the storage first
```
spark.read.format("csv").load("abfss://container@account.dfs.core.windows.net/sample.csv").collect()
```

## References

- See [Databricks Storage Documentation](https://docs.microsoft.com/en-us/azure/databricks/data/data-sources/azure/azure-storage) for more details
- See [Access Azure Data Lake Storage using Azure Active Directory credential passthrough](https://learn.microsoft.com/en-us/azure/databricks/data-governance/credential-passthrough/adls-passthrough) for using credential passthrough to access your Blob storage in Databricks
