# Access your storage account in Databricks

## Assumptions
- Familiarity with file API in Python or R
- Access to Databricks has been granted by Datahub team

## Mount point 

The storage account can be mounted in Databricks just like a regular folder.
Mounting storage in Databricks allows you to access objects in object storage as if they were on the local file system.

For instance, once you have mounted a folder in ```/mnt/test/data```, the python programs in Databricks can access files in that storage container as if they were local files.

## Mount point code

```
dbutils.fs.mount(
source = "wasbs://costing@<storage_account>",
mount_point = "/mnt/<project_acronym>/data",
extra_configs = {"fs.azure.account.key.<storage_account>":"<sas_token>"})
```
## References


See [Databricks Storage Documentation](https://docs.microsoft.com/en-us/azure/databricks/data/data-sources/azure/azure-storage) for more details