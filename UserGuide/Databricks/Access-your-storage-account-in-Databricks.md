# Access your storage account in Databricks

When your Databricks workspace is created for your project, an Azure Storage Account has already been created. DataHub also mounts the Blob storage of the Storage Account with the pre-created Databricks cluster (main_cluster). This mount is for your convenience and access to the Blob data is subject to your identity. At the time of writing, all project members have full access to the Blob storage.

## Assumptions
- Familiarity with file API in Python or R
- Access to Databricks has been granted by Datahub team

## Default Mount point 

The storage account has been mounted in Databricks to the default cluster (main_cluster) and can be accessed in your Noteobok just like a regular folder.
Mounting storage in Databricks allows you to access objects in object storage as if they were on the local file system.

To access the mount point in the default cluster, consider the sample code below
```
df = spark.read.option("header","true").csv('/mnt/datahub-main-mount/export-2.csv');
df.show(3);
```
In the above example, the path `/mnt/datahub-main-mount/` points to the root of your Blob storage.

## Mount to More Clusters

As you create more clusters, you can mount the default Blob storage or other storage account to them in your code.

For instance, once you have mounted a folder in ```/mnt/test/data```, the python programs in Databricks can access files in that storage container as if they were local files.

## References


See [Databricks Storage Documentation](https://docs.microsoft.com/en-us/azure/databricks/data/data-sources/azure/azure-storage) for more details
