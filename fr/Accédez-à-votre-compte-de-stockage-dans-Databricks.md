[_metadata_: remarks]:- "Automatically translated with DeepL. From: /Access-your-storage-account-in-Databricks.md"

[_(draft documentation, please review)_](/Access-your-storage-account-in-Databricks.md)

# Accéder à votre compte de stockage dans Databricks

## Hypothèses
- Familiarité avec l'API de fichier en Python ou R
- L'accès aux Databricks a été accordé par l'équipe de Datahub.

## Point de montage

Le compte de stockage peut être monté dans Databricks comme un dossier ordinaire.
Le montage du stockage dans Databricks vous permet d'accéder aux objets du stockage objet comme s'ils étaient sur le système de fichiers local.

Par exemple, une fois que vous avez monté un dossier dans ``/mnt/test/data``, les programmes python de Databricks peuvent accéder aux fichiers de ce conteneur de stockage comme s'il s'agissait de fichiers locaux.

## Code du point de montage

```
dbutils.fs.mount(
source = "wasbs://costing@<storage_account>",
mount_point = "/mnt/<project_acronym>/data",
extra_configs = {"fs.azure.account.key.<storage_account>" :"<sas_token>"})
```
## Références


Voir [Databricks Storage Documentation] (https://docs.microsoft.com/en-us/azure/databricks/data/data-sources/azure/azure-storage) pour plus de détails.
