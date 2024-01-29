---
remarks: Automatically translated with DeepL
source: /UserGuide/Databricks/Access-aws-storage-account-in-Databricks.md
draft: true
---

# Accéder au compte de stockage AWS dans Databricks

## Databricks Mount Point

Le moyen le plus courant d'accéder au stockage en nuage dans Databricks est d'utiliser des points de montage.

Le code suivant va monter le compte AWS dans databricks dans le point de montage `/mnt/aws` et le rendre disponible pour le notebook (Voir [ceci pour plus de détails sur les points de montage Databricks](https://docs.databricks.com/en/dbfs/mounts.html)).
```
bucket_name = dbutils.secrets.get(scope = "dh-workspace", key = "<aws_s3_bucket>")
access_key = dbutils.secrets.get(scope = "dh-workspace", key = "<aws_access_key>")
secret_key = dbutils.secrets.get(scope = "dh-workspace", key = "<aws_access_key_secret>")

#Mount bucket on databricks
encoded_secret_key = secret_key.replace("/", "%2F")
mount_name = "aws"
dbutils.fs.mount("s3a://%s:%s@%s" % (access_key, encoded_secret_key, bucket_name), "/mnt/%s" % mount_name)
```
