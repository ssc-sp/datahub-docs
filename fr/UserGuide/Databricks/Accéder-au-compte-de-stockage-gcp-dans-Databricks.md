---
remarks: Automatically translated with DeepL
source: /UserGuide/Databricks/Access-gcp-storage-account-in-Databricks.md
draft: true
---

# Accéder au compte de stockage AWS dans Databricks

## Databricks Mount Point

Le moyen le plus courant d'accéder au stockage en nuage dans Databricks est d'utiliser des points de montage.

Le code suivant va monter le compte GCP dans databricks dans le point de montage `/mnt/gcp` et le rendre disponible pour le notebook (Voir [ceci pour plus de détails sur les points de montage Databricks](https://docs.databricks.com/en/dbfs/mounts.html)).
```
gcp_account = dbutils.secrets.get(scope = "dh-workspace", key = "<gcp_account_key>")
gcp-project-id = dbutils.secrets.get(scope = "dh-workspace", key = "<gcp_project_id>")
values = json.load(gcp_account)

spark.conf.set(
    "google.cloud.auth.service.account.enable", "true")

#Mount bucket on databricks
mount_name = "gcp"
dbutils.fs.mount("gs://<nom_du_conteneur>", "/mnt/gcp" % nom_du_montage, ,
  extra_configs = {"fs.gs.project.id" : gcp-project-id,
                   "fs.gs.auth.service.account.email":<email>,
                   "fs.gs.auth.service.account.private.key":values["private_key"],
                   "fs.gs.auth.service.account.private.key.id" : values["private_key_id"]
                    })
```
