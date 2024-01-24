# Access AWS storage account in Databricks

## Databricks Mount Point

The most common way to cloud storage in Databricks is through mount points. 

The following code will mount the AWS account in databricks in mount point `/mnt/az` and make it available to the notebook (See [this for more details on Databricks mount points](https://docs.databricks.com/en/dbfs/mounts.html)).
```
account_key = dbutils.secrets.get(scope = "dh-workspace", key = "<az_key>") 
storage_account = dbutils.secrets.get(scope = "dh-workspace", key = "<az_name>") 

spark.conf.set(
    ("fs.azure.account.key.%s.blob.core.windows.net" % storage_account),account_key)

access_path = ("wasbs://<container_name>@%s.blob.core.windows.net/" % storage_account)

#Mount bucket on databricks
mount_name = "az"
dbutils.fs.mount(access_path, "/mnt/%s" % mount_name)
```