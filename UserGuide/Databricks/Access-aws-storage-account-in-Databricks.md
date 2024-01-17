# Access AWS storage account in Databricks

## Databricks Mount Point

The most common way to cloud storage in Databricks is through mount points. 

The following code will mount the AWS account in databricks in mount point `/mnt/aws` and make it available to the notebook (See [this for more details on Databricks mount points](https://docs.databricks.com/en/dbfs/mounts.html)).
```
bucket_name = dbutils.secrets.get(scope = "dh-workspace", key = "<aws_s3_bucket>") 
access_key = dbutils.secrets.get(scope = "dh-workspace", key = "<aws_access_key>") 
secret_key = dbutils.secrets.get(scope = "dh-workspace", key = "<aws_access_key_secret>") 

#Mount bucket on databricks
encoded_secret_key = secret_key.replace("/", "%2F")
mount_name = "aws"
dbutils.fs.mount("s3a://%s:%s@%s" % (access_key, encoded_secret_key, bucket_name), "/mnt/%s" % mount_name)
```