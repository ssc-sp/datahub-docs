---
remarks: Automatically translated with DeepL
source: /Banners/AWS-storage-Databricks.md
draft: true
---

# Accéder à votre compte de stockage dans Databricks

Le compte de stockage a été monté dans Databricks sur le cluster par défaut (main_cluster) et on peut y accéder dans votre Noteobok comme à un dossier ordinaire.
Le montage du stockage dans Databricks vous permet d'accéder aux objets du stockage objet comme s'ils étaient sur le système de fichiers local.

Pour accéder au point de montage dans le cluster par défaut, considérez l'exemple de code ci-dessous
```
df = spark.read.option("header", "true").csv('/mnt/fsdh-dbk-main-mount/sample.csv') ;
df.show(3) ;
```
Dans l'exemple ci-dessus, le chemin pré-créé `/mnt/fsdh-dbk-main-mount/` pointe vers le conteneur `datahub` de votre stockage Blob. Le fichier `sample.csv` est à titre d'illustration et vous devez le changer pour votre nom de fichier.

Pour accéder au même chemin pré-créé à partir de R en utilisant SparkR, référez-vous à l'exemple de code suivant.

```
%r

bibliothèque(SparkR)
sparkR.session()
df <- read.df("dbfs:/mnt/fsdh-dbk-main-mount/sample.csv", source = "csv")
head(df, 3)
```

## En savoir plus

Voir [Accéder à votre compte de stockage] (/UserGuide/Databricks/Access-your-storage-account-in-Databricks.md) pour plus de détails.
