# PostgreSQL vs Azure Databricks Database Features

The Federal Science DataHub offers multiple ways to use database functionality. This guide will compare the use of a PostgreSQL database on FSDH with the database features provided by Azure Databricks.

## Introduction

When it comes to hosting a database with FSDH, there are multiple options available. One popular choice is using PostgreSQL, while another option is leveraging the database features provided by Azure Databricks. In this comparison, we will explore the key differences and benefits of each approach.

## PostgreSQL

PostgreSQL is a fully managed database service that allows you to deploy PostgreSQL databases in the cloud. It provides high availability, automatic backups, and integration with other services. Some of the key features of PostgreSQL include:

- Easy deployment of PostgreSQL databases
- Built-in high availability and automatic backups
- Support for advanced PostgreSQL features such as JSONB, full-text search, and spatial data types
- Seamless integration with other services like web apps or APIs

## Azure Databricks Database Features (Hive)

Azure Databricks is an analytics platform that combines Apache Spark with a collaborative environment for data science and machine learning. While it is primarily known for its big data processing capabilities, Azure Databricks also provides powerful database features. Some of the key database features offered by Azure Databricks include:

- Delta Lake: A transactional storage layer that provides ACID transactions, schema enforcement, and data versioning for data lakes.
- Delta Engine: A high-performance query engine optimized for Delta Lake, enabling fast and scalable SQL queries on large datasets.
- Delta Live Tables: A real-time change data capture (CDC) feature that allows you to capture and process real-time data changes from various sources.
- Data Lakehouse Architecture: Azure Databricks promotes a unified architecture that combines the best of data lakes and data warehouses, enabling efficient data storage, processing, and analytics.

Databricks leverages the standard [Apache Hive](https://hive.apache.org/) project which enables to leverage standard storage and query data using SQL. The underlying model is quite different from a traditional database.
- Databricks SQL requires the cluster to be enabled to run SQL queries
- Large datasets can be easily accomodated by simply scaling the cluster size
- There is only storage costs for data that is not used
- Large datasets are cost efficient because standard Azure storage is used.

## Comparison

This chart outlines the key differences between PostgreSQL and Azure Databricks Database Features:

| Feature          | PostgreSQL                                                                | Azure Databricks Database Features (Hive Tables)                                               |
| ---------------- | ------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| Database Model   | Traditional Relational Database                                           | Unified data analytics platform based on Lakehouse architecture                                |
| Primary Use Case | General-purpose database. Web app / API integration. Complex SQL queries. | Big data analytics and real-time processing. Machine Learning. Collaborative data exploration. |
| Schema           | Strict traditional SQL Schema                                             | Flexible and auto-schema management                                                            |
| Performance      | Good for OLTP workloads.                                                  | Optimized for big data processing.                                                             |
| Scalability      | Limited scaling in current setup                                          | Horizontal scaling with Delta Engine.                                                          |
| Integration      | Seamless integration with web apps and APIs.                              | Integration with big data processing and machine learning workflows.                           |

## Recommende use cases

### PostgreSQL

- Web Application
- Interactive Form
- API integration
- Connection to existing application

### Databricks SQL Hive Tables

- Databricks Dashboards
- Science experiment data
- Evolving data that requires flexible schemas
- ETL pipeline intermediary data

## Costing Difference

### On-Demand Databricks

- Databricks costing is _pay for what you use_ aka it depends on the cluster size and how long the cluster has been running
- With light usage, it is possible to keep databricks under $100 in a month and that includes Hive tables
- It is recommended to perform some small experiments and monitor the costs to precisely estimate the cost

### Postgresql Cost

- Postgresql in FSDH uses the [Azure Flexible Server](https://learn.microsoft.com/en-us/azure/postgresql/flexible-server/quickstart-create-server-portal) model which is also based on consumption (burstable model)
- With very light usage, it costs about $30/month
- It is recommended to perform experiments as well and monitor the cost to determine more precisely the cost for a specific application

## Connectivity

| Feature                      | PostgreSQL | Azure Databricks Database Features     |
| ---------------------------- | ---------- | -------------------------------------- |
| Connect from Web Application | X          | Not possible                           |
| Connect from Power BI        | X          | X                                      |
| Connect from Tableau         | X          | X                                      |
| Connect from Python          | X          | Possible but requires cluster to be on |

## Conclusion

In conclusion, PostgreSQL and Azure Databricks Database Features offer different strengths and use cases. PostgreSQL is well-suited for general-purpose database workloads, web app integration, and complex SQL queries. On the other hand, Azure Databricks database features are optimized for big data analytics, real-time processing, and collaborative data exploration. Depending on your specific use case and requirements, you can choose the database solution that best fits your needs.