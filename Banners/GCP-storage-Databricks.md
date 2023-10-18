# Access your storage account in Databricks

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

## Learn More

See [Access your storage account](/UserGuide/Databricks/Access-your-storage-account-in-Databricks.md) for more details