---
onProfileInclude: ssc
---

## Azure Databricks for Cloud Analytics

Databricks is a platform similar to Jupyter notebooks and enables scientists to create and share documents that include live code, equations, and other multimedia resources. Databricks integrates with cloud storage and security in your cloud account, and manages and deploys cloud infrastructure on your behalf.

### Accessing Storage through Databricks

The DataHub provides an unified environment with storage and databricks and each workspace includes a storage account that can be accessed through Databricks using mount points. (DOES THIS NEED MORE DETAIL??)

### Databricks Cluster Policies

The DataHub provides a few pre-defined cluster policies and a default all purpose cluster out of the box. Project lead users can create additional clusters using one of the policies. Regular project users can start and use these clusters.

|Policy Name | Max DBU Per Hour |Node Type |Max Workers |
|------------|------------------|----------|----------- |
| DataHub Small |4 |<ul><li>Standard_D4ds_v5</li></ul>|2|
| DataHub Regular | 12 | <u/><li>Standard_D4ds_v5 (Default)</li><li>Standard_D8ds_v5</li><li>Standard_D16ds_v5</li></ul>| 4| 
| DataHub Large|64|<ul><li>Standard_D4ds_v5</li><li>Standard_D8ds_v5 (Default)</li><li>Standard_D16ds_v5</li><li>Standard_D32ds_v5</li><li>Standard_D48ds_v5</li><li>Standard_D64ds_v5</li></ul>|32 |

### Learn more about Databricks

See the following links for a list of resources for working with Databricks, Python, R and Spark:

- [Learning the basics about Databricks and Spark](Databricks/Databricks-and-Spark-SQL-tutorials)
- [Official Databricks Documentation](https://docs.databricks.com/)
- [Databricks Getting Started Guide]( https://docs.databricks.com/getting-started/index.html)
- [Databricks Community Edition](https://databricks.com/product/faq/community-edition) - You can use this edition free of charge for learning purpose
- [Intro to Databricks (Demo)](https://www.youtube.com/watch?v=n-yt_3HvkOI&t=27s)
- [Databricks Youtube Channel](https://www.youtube.com/channel/UC3q8O3Bh2Le8Rj1-Q-_UUbA)
- [Spark Sql](https://docs.databricks.com/spark/latest/spark-sql/index.html) - although you may not be handling big data, the spark API might come in handy for data wrangling tasks 
- [Spark SQL Guide](https://spark.apache.org/docs/latest/sql-programming-guide.html)
- [Intro to Spark](https://www.kdnuggets.com/2018/10/apache-spark-introduction-beginners.html)




