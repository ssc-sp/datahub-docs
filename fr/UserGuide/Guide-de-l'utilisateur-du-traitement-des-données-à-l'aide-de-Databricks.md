[_metadata_: remarks]:- "Automatically translated with DeepL. From: /UserGuide/Data-Processing-using-Databricks---User-Guide.md"

[_(draft documentation, please review)_](/UserGuide/Data-Processing-using-Databricks---User-Guide.md)


Veuillez noter que le langage de programmation utilisé pour ce guide de l'utilisateur est principalement Python. Toutefois, vous pouvez consulter le site Web fourni sous chaque section pour des exemples utilisant d'autres langages tels que Scala et R.

## Accéder aux fichiers du stockage Data Lake et les charger dans un dataframe spark.

df=spark.read.format('csv').option("header", "true").load('abfss://databricks-demo@datahubdatalakedev.dfs.core.windows.net/demo/export-2.csv')

<databricks-demo> est le conteneur
<datahubdatalakedev> est le compte de stockage du blob

https://docs.databricks.com/data/data-sources/azure/azure-storage.html

## Lire les données du fichier excel
projectsDf = spark.read.format("com.crealytics.spark.excel").option("sheetName", fiscal_year + " Projects").option("dataAddress", "A5").option("Header", False).load("dbfs:/mnt" + vMountDirectory + vFileName)

*Requiert que la bibliothèque crealytics soit installée sur le cluster



## Commandes SQL Spark fréquemment utilisées

#### Sélectionnez les lignes d'un cadre de données en les filtrant :
df.select("GEO", "Value", "Date").where("value >6000").show()

#### Filtre les lignes avec des valeurs non nulles :
dfND = df.where(df["VALUE"].isNotNull())

####Groupe par une colonne et obtient le nombre de lignes :
dfCountByLF=dfND.groupBy("Labour_force_characteristics").count()

####Rename colonnes :
renamedDf = df.withColumnRenamed("LName", "Last_Name")

https://spark.apache.org/docs/latest/sql-programming-guide.html


## Utilisation de différents langages de programmation au sein d'un même notebook (Python, sql, scala, R)

#### Convertir un dataframe Spark en dataframe Pandas (Python) ordinaire :
import pandas
pandasDf = df.select("*").toPandas()

#### Créez une table temporaire (vue) à partir d'un cadre de données et interrogez la vue en utilisant sql.
dfFullTimeEmp.createOrReplaceTempView("vw_dfFullTimeEmp")

SELECT sum(value) Emploi, NAICS FROM vw_dfFullTimeEmp
WHERE NAICS <> "Total, toutes les industries".
GROUPE PAR SCIAN
ORDER BY Employment desc

#### Convertir le jeu de données en un dataframe SparkR
%r
bibliothèque(SparkR)
sdrf2<-sql("SELECT * FROM vw_dfFullTimeEmp ")


## Stocker les données

#### Créer une table persistante dans le Data Lake
CRÉER UNE TABLE SI ELLE N'EXISTE PAS DEMO_LABOUR_FORCE
UTILISATION DE DELTA
LOCATION 'abfss://databricks-demo@datahubdatalakedev.dfs.core.windows.net/demo/tbl/'
AS SELECT * FROM vw_dfFullTimeEmp

#### Visitez la version précédente de la table du lac delta en utilisant sql
SELECT * FROM DEMO_LABOUR_FORCE TIMESTAMP AS OF '2021-02-22T22:32:33.000+0000'

#### Écriture de données dans une base de données SQL Server
server_name = "jdbc:sqlserver://sqlserver-ciosb-datahub.database.windows.net"
nom de la base de données = "spi-drf-db
url = nom du serveur + " ;" + "nom de la base de données=" + nom de la base de données + " ;".

nom d'utilisateur = <nom d'utilisateur BD>
password = dbutils.secrets.get(scope = "datalake-key-dev", key = "sqladmin-pswd-ciosb-datahub")

nom_table_projet_tracker = "EA_PROJECT_TRACKER
projectsDf_with_uniqueID.write.format("jdbc").mode("overwrite").option("url", url).option("dbtable", table_name_project_tracker).option("user", username) .option("password", password).save()





