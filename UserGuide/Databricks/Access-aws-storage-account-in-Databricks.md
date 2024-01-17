# Access AWS storage account in Databricks

```
bucket_name = dbutils.secrets.get(scope = "dh-workspace", key = "st-17-BucketName") 
access_key = dbutils.secrets.get(scope = "dh-workspace", key = "st-17-AccessKeyId") 
secret_key = dbutils.secrets.get(scope = "dh-workspace", key = "st-17-AccessKeySecret") 

#Mount bucket on databricks
encoded_secret_key = secret_key.replace("/", "%2F")
mount_name = "bucket"
dbutils.fs.mount("s3a://%s:%s@%s" % (access_key, encoded_secret_key, bucket_name), "/mnt/%s" % mount_name)
```