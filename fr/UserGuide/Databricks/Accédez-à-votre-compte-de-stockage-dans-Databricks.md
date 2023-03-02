---
remarks: Automatically translated with DeepL
source: /UserGuide/Databricks/Access-your-storage-account-in-Databricks.md
draft: true
---

# Accéder à votre compte de stockage dans Databricks

Lorsque votre espace de travail Databricks est créé pour votre projet, un compte de stockage Azure a déjà été créé. DataHub monte également le stockage Blob du compte de stockage avec le cluster Databricks précréé (main_cluster). Ce montage est pour votre commodité et l'accès aux données Blob est soumis à votre identité. Au moment de la rédaction de ce document, tous les membres du projet ont un accès complet au stockage Blob.

## Hypothèses
- Familiarité avec l'API de fichier en Python ou R
- L'accès aux Databricks a été accordé par l'équipe de Datahub.

## Point de montage par défaut

Le compte de stockage a été monté dans Databricks sur le cluster par défaut (main_cluster) et on peut y accéder dans votre Noteobok comme à un dossier ordinaire.
Le montage du stockage dans Databricks vous permet d'accéder aux objets du stockage objet comme s'ils étaient sur le système de fichiers local.

Pour accéder au point de montage dans le cluster par défaut, considérez l'exemple de code ci-dessous
```
df = spark.read.option("header", "true").csv('/mnt/fsdh-dbk-main-mount/sample.csv') ;
df.show(3) ;
```
Dans l'exemple ci-dessus, le chemin `/mnt/fsdh-dbk-main-mount/` pointe vers le conteneur `datahub` de votre stockage Blob. Le fichier `sample.csv` est pour l'illustration et vous devez changer le nom de votre fichier.

## Monter vers plus de clusters

Au fur et à mesure que vous créez d'autres clusters, vous pouvez leur monter le stockage Blob par défaut ou un autre compte de stockage dans votre code.

Par exemple, une fois que vous avez monté un dossier dans ``/mnt/test/data``, les programmes python de Databricks peuvent accéder aux fichiers de ce conteneur de stockage comme s'il s'agissait de fichiers locaux.

## Références


Voir [Databricks Storage Documentation] (https://docs.microsoft.com/en-us/azure/databricks/data/data-sources/azure/azure-storage) pour plus de détails.
