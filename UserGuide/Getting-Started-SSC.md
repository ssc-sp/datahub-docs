---
onProfileInclude: ssc
---
# Welcome to DataHub

## Metadata Profile

To activate a workspace and request resources, the owner is required to complete a minimal metadata profile to activate their workspaces and request resources. The profile consists of few question to provide more context about the project to the Science Program and help other users. See [Workspace Metadata Profile](Metadata/Workspace_Profile.md) for more details.

## Collaborating with DataHub and Cloud Storage

To collaborate on datasets, DataHub Workspaces enable the creation of cloud Storage Accounts. Azure Storage Accounts can be provisioned for all users and provide a way to collaborate and exchange large data sets between users from different departments.

### Creating a storage account

Once the metadata for a workspace is requested, it is possible to request a storage account. The steps involved are detailed in [Creating Storage Account](Storage/Creating-Storage.md)

### Uploading files to my Storage Account

Uploading files to your storage account is similar to other platforms like OneDrive or SharePoint. The main interface can be accessed using the [Storage Explorer](Storage/Storage-Explorer.md)

### Uploading large datasets

To upload large datasets, it is recommended to use a tool called [azcopy](Storage/Use-AzCopy-to-Interact-with-Azure-Storage-Account.md) that will run on the command line. The web browser upload is not recommended for large uploads (this depends on the internet connection but usually anything above 1Gb) because the web upload could be interrupted with disconnections or other bandwidth issues.

### Sharing uploaded files

The easiest way to share uploaded files is to invite collaborators to your workspace. See [Invite Collaborators](Projects/Invite-Users.md)

## Cloud analytics with Python, R and Databricks

All participants of use case 2 (analytics) can request a databricks instance in their workspace.

Databricks is a platform similar to Jupyter notebooks and enables scientists to create and share documents that include live code, equations, and other multimedia resources. Databricks integrates with cloud storage and security in your cloud account, and manages and deploys cloud infrastructure on your behalf.

### Learn more about Databricks

See the following links for a list of resources for working with Databricks, Python, R and Spark:

- [Learning the basics about Databricks and Spark](Databricks/Databricks-and-Spark-SQL-tutorials)
- [Databricks Frequently Asked Questions](Databricks/Databricks-FAQ.md)
- [Official Databricks Documentation](https://docs.databricks.com/)
- [Databricks Getting Started Guide]( https://docs.databricks.com/getting-started/index.html)
- [Databricks Community Edition](https://databricks.com/product/faq/community-edition) - You can use this edition free of charge for learning purpose
- [Intro to Databricks (Demo)](https://www.youtube.com/watch?v=n-yt_3HvkOI&t=27s)
- [Databricks Youtube Channel](https://www.youtube.com/channel/UC3q8O3Bh2Le8Rj1-Q-_UUbA)
- [Spark Sql](https://docs.databricks.com/spark/latest/spark-sql/index.html) - although you may not be handling big data, the spark API might come in handy for data wrangling tasks 
- [Spark SQL Guide](https://spark.apache.org/docs/latest/sql-programming-guide.html)
- [Intro to Spark](https://www.kdnuggets.com/2018/10/apache-spark-introduction-beginners.html)

### Accessing Storage through Databricks

The DataHub provides an unified environment with storage and databricks and each workspace includes a storage account that can be accessed through Databricks using mount points.


