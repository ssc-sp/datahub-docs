# Prepare for Geospatial workload in Databricks

This article explains how to prepare your Databricks for geospatial analysis. Also check https://medium.com/@milos.colic/unifying-raster-and-vector-data-with-mosaic-76b00a4d2b96

## Prepare Cluster Manually

1. Go to Compute and create a new cluster or edit an existing cluster
1. Click on "Libraries" tab
1. Click "Install new"
1. Library Source = PyPI, Package = databricks-mosaic
1. Click Install
1. Run the following setup code (only once)
    ```
    import mosaic as mos
    mos.enable_mosaic(spark, dbutils)
    mos.setup_gdal(spark)
    ```
1. Edit the cluster and add the init script: `dbfs:/FileStore/geospatial/mosaic/gdal/mosaic-gdal-init.sh`
1. Restart the cluster
1. Use the following code in a notebook
    ```
    import mosaic as mos
    mos.enable_mosaic(spark, dbutils)
    mos.enable_gdal(spark)
    ```

## Create Cluster Using Policy (Evaluation only)
1. Create a new cluster using cluster policy "Geo Cluster"
1. Edit the cluster to add the init script: `init-geo.sh``
1. Follow the same steps in manual mode to run the setup code
