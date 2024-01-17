# Access AWS storage account in Databricks

## Databricks Mount Point

The most common way to cloud storage in Databricks is through mount points. 

The following code will mount the GCP account in databricks in mount point `/mnt/gcp` and make it available to the notebook (See [this for more details on Databricks mount points](https://docs.databricks.com/en/dbfs/mounts.html)).
```
gcp_account = dbutils.secrets.get(scope = "dh-workspace", key = <gcp_account_key>) 
gcp-project-id = dbutils.secrets.get(scope = "dh-workspace", key = "<gcp_project_id>")

#Mount bucket on databricks
encoded_secret_key = secret_key.replace("/", "%2F")
mount_name = "gcp"
dbutils.fs.mount("gs://%s"  (bucket_name), "/mnt/gcp" % mount_name, ,
  extra_configs = {"fs.gs.project.id": gcp-project-id)
```