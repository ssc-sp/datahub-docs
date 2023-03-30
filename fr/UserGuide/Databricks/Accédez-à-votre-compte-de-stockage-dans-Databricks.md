---
remarks: Automatically translated with DeepL
source: /UserGuide/Databricks/Access-your-storage-account-in-Databricks.md
draft: false
---

# Accéder à votre compte de stockage dans Databricks

Lorsque votre espace de travail Databricks est créé pour votre projet, un compte de stockage Azure a déjà été créé. DataHub monte également le stockage Blob du compte de stockage avec le cluster Databricks précréé (main_cluster). Ce montage est pour votre commodité et l'accès aux données Blob est soumis à votre identité. Au moment de la rédaction de ce document, tous les membres du projet ont un accès complet au stockage Blob.

## Hypothèses
- Familiarité avec l'API de fichier en Python ou R
- L'accès aux Databricks a été accordé par l'équipe de DHSF.

## Point de montage par défaut du DHSF

Le compte de stockage a été monté dans Databricks sur le cluster par défaut (main_cluster) et on peut y accéder dans votre Noteobok comme à un dossier ordinaire.
Le montage du stockage dans Databricks vous permet d'accéder aux objets du stockage objet comme s'ils étaient sur le système de fichiers local.

Pour accéder au point de montage dans le cluster par défaut, considérez l'exemple de code ci-dessous
```
df = spark.read.option("header", "true").csv('/mnt/fsdh-dbk-main-mount/sample.csv') ;
df.show(3) ;
```
Dans l'exemple ci-dessus, le chemin pré-créé `/mnt/fsdh-dbk-main-mount/` pointe vers le conteneur `datahub` de votre stockage Blob. Le fichier `sample.csv` est à titre d'illustration et vous devez le changer pour votre nom de fichier.

## Montage sur d'autres clusters

Au fur et à mesure que vous créez des clusters basés sur les politiques de cluster DataHub, vous pouvez monter le stockage Blob de votre projet dans votre code.

### Option 1 - Monter le conteneur Blob

1. Montez le conteneur

   ```
    configs = {
      "fs.azure.account.auth.type" : "CustomAccessToken",
      "fs.azure.account.custom.token.provider.class" : spark.conf.get("spark.databricks.passthrough.adls.gen2.tokenProviderClassName")
    }

    dbutils.fs.mount(
       source = "abfss://container@account.dfs.core.windows.net/",
       mount_point = "/mnt/my-mountpoint",
       extra_configs = configs)
   ```
2. Une fois que vous avez monté un dossier dans ```/mnt/my-mountpoint``, les programmes python de Databricks peuvent accéder aux fichiers de ce conteneur de stockage comme s'il s'agissait de fichiers locaux.
    ```
    df = spark.read.option("header", "true").csv('/mnt/my-mountpoint/sample.csv') ;
    df.show(3) ;
    ```

### Option 2 - Accès direct aux fichiers individuels

Vous pouvez également accéder directement aux fichiers sans monter le stockage au préalable.
```
spark.read.format("csv").load("abfss://container@account.dfs.core.windows.net/sample.csv").collect()
```

## Références

- Voir [Databricks Storage Documentation](https://docs.microsoft.com/en-us/azure/databricks/data/data-sources/azure/azure-storage) pour plus de détails.
- Voir [Access Azure Data Lake Storage using Azure Active Directory credential passthrough](https://learn.microsoft.com/en-us/azure/databricks/data-governance/credential-passthrough/adls-passthrough) pour l'utilisation du credential passthrough pour accéder à votre stockage Blob dans Databricks.
