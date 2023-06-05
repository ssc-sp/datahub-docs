---
remarks: Automatically translated with DeepL
source: /UserGuide/Databricks/Access-your-storage-account-in-Docker-cluster.md
draft: true
---

# Accédez à votre compte de stockage dans Databricks à partir d'un cluster basé sur Docker.

DHSF propose un runtime basé sur Docker comme option pour vos clusters Databricks. Cet article décrit comment vous connecter à votre compte de stockage à partir de ce type de runtime.

Lorsque votre espace de travail Databricks est initialement créé, la clé de votre compte de stockage a été sauvegardée dans votre Azure Key Vault. De plus, une portée secrète `datahub` a été créée pour permettre de référencer la clé à partir de vos notebooks en utilisant `dbutils.secrets.get(scope = "datahub", key = "storage-key")`


## Stockage des montages
L'exemple de code suivant illustre comment monter votre compte de stockage. Remplacez `mystorageaccount` par le nom de votre compte de stockage. Remplacez également `mydata` par le nom de montage de votre choix.

```
dbutils.fs.mount(
    source = "wasbs://datahub@mystorageaccount.blob.core.windows.net/",
    mount_point = "/mnt/mydata",
    extra_configs = {"fs.azure.account.key.mystorageaccount.blob.core.windows.net":dbutils.secrets.get(scope = "datahub", key = "storage-key")})
dbutils.fs.ls("/mnt/mydata")
```

## Utilisation de la monture

Le point de montage `/mnt/mydata` peut maintenant être utilisé dans vos carnets. L'exemple de code suivant illustre comment accéder aux données sur le point de montage.

```
dbutils.fs.ls("/mnt/mydata/conda_test_data")
dbutils.fs.cp("/mnt/mydata/conda_test_data", "/tmp", True)
dbutils.fs.ls("/tmp")
!fastqc /dbfs/tmp/SRR957824_500K_R1.fastq.gz /dbfs/tmp/SRR957824_500K_R2.fastq.gz -o /dbfs/tmp/testout
dbutils.fs.cp("/tmp/testout", "/mnt/mydata/conda_test_data", True)
```
