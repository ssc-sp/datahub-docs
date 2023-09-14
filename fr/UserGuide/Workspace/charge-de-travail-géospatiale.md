---
remarks: Automatically translated with DeepL
source: /UserGuide/Workspace/geospatial-workload.md
draft: true
---

# Préparer la charge de travail géospatiale dans Databricks

Cet article explique comment préparer vos Databricks pour l'analyse géospatiale. Consultez également le site https://medium.com/@milos.colic/unifying-raster-and-vector-data-with-mosaic-76b00a4d2b96

## Préparer le cluster manuellement

1. Allez dans Compute et créez un nouveau cluster ou modifiez un cluster existant.
1. Cliquez sur l'onglet "Bibliothèques
1. Cliquez sur "Installer nouveau"
1. Source de la bibliothèque = PyPI, Paquet = databricks-mosaic
1. Cliquez sur Installer
1. Exécutez le code d'installation suivant (une seule fois)
    ```
    Importation de mosaïque en tant que mos
    mos.enable_mosaic(spark, dbutils)
    mos.setup_gdal(spark)
    ```
1. Editez le cluster et ajoutez le script init : `dbfs:/FileStore/geospatial/mosaic/gdal/mosaic-gdal-init.sh`
1. Redémarrer le cluster
1. Utilisez le code suivant dans un cahier
    ```
    Importation de mosaïque en tant que mos
    mos.enable_mosaic(spark, dbutils)
    mos.enable_gdal(spark)
    ```

## Créer un cluster à l'aide d'une politique (évaluation uniquement)
1. Créez un nouveau cluster en utilisant la politique de cluster "Datahub Geo Cluster"
1. Editez le cluster pour ajouter le script init : `/init-geo.sh`
1. Suivez les mêmes étapes en mode manuel pour exécuter le code d'installation.
