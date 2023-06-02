# Access your storage account in Databricks from a Docker based cluster

FSDH provides Docker based runtime as an option for your Databricks clusters. This article describes how you connect to your storage account from this type of runtime.

When your Databricks workspace is initially created, the key for your storage account has been saved to your Azure Key Vault. In addition, a secret scope `datahub` has been created to allow referencing the key from your notebooks using `dbutils.secrets.get(scope = "datahub", key = "storage-key")`


## Mount Storage
The following sample code illustrates how to mount your storage account. Replace `mystorageaccount` with your storage account name. Also replace `mydata` with your mount name of choice. 

```
dbutils.fs.mount(
    source = "wasbs://datahub@mystorageaccount.blob.core.windows.net/",    
    mount_point = "/mnt/mydata",            
    extra_configs = {"fs.azure.account.key.mystorageaccount.blob.core.windows.net":dbutils.secrets.get(scope = "datahub", key = "storage-key")})
dbutils.fs.ls("/mnt/mydata")
```

## Using the Mount

The mountpoint `/mnt/mydata` can now be used in your notebooks. The following sample code illustrates how you access the data on the mount point.

```
dbutils.fs.ls("/mnt/mydata/conda_test_data")
dbutils.fs.cp("/mnt/mydata/conda_test_data", "/tmp", True)
dbutils.fs.ls("/tmp")
!fastqc /dbfs/tmp/SRR957824_500K_R1.fastq.gz /dbfs/tmp/SRR957824_500K_R2.fastq.gz -o /dbfs/tmp/testout
dbutils.fs.cp("/tmp/testout", "/mnt/mydata/conda_test_data", True)
```
