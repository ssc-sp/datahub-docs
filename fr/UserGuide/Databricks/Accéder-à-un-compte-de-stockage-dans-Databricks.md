---
remarks: Automatically translated with DeepL
source: /UserGuide/Databricks/Access-az-storage-account-in-Databricks.md
draft: true
---

# Accéder au compte de stockage Azure dans Databricks

## Databricks Mount Point

Le moyen le plus courant d'accéder au stockage en nuage dans Databricks est d'utiliser des points de montage.

Le code suivant va monter le compte AWS dans databricks dans le point de montage `/mnt/az` et le rendre disponible pour le notebook (Voir [ceci pour plus de détails sur les points de montage Databricks](https://docs.databricks.com/en/dbfs/mounts.html)).
```
account_key = dbutils.secrets.get(scope = "dh-workspace", key = "<az_key>")
storage_account = dbutils.secrets.get(scope = "dh-workspace", key = "<az_name>")

spark.conf.set(
    ("fs.azure.account.key.%s.blob.core.windows.net" % storage_account),account_key)

access_path = ("wasbs://<nom_du_conteneur>@%s.blob.core.windows.net/" % storage_account)

#Mount bucket on databricks
mount_name = "az"
dbutils.fs.mount(access_path, "/mnt/%s" % mount_name)
```
