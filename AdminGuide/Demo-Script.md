# Section 0: Onboarding and Login

**Prep:** Sign out

1. Open https://federal-science-datahub.canada.ca
2. On login screen mention that you use the MS Teams account and password which can be different from your network credentials.
3. Mention that the login screen is going to be different for each department. The authentication in DataHub leverages existing AAD.

# Section 1: Portal and Workspace Overview

## Terms & Conditions and Language

Before entering the Federal Science DataHub Portal, there are two important steps you need to complete.

1. **You need to select a language for the portal.** This language selection ensures that you can easily navigate and use the platform in your preferred language.

1. **You need to accept the Terms and Conditions** that govern the use of the platform. This is an essential requirement to gain access to the features and benefits of DataHub.

Once you have selected a language and accepted the Terms and Conditions, you will be granted access to the portal.

> It's worth noting that **you can switch between different languages** inside the portal using your profile. This feature allows you to change your language preference at any time

> There are helper banners that appear at the top of the portal to help you navigate and use the platform. These banners are available in both English and French and can be dismissed at any time.

## What is a workspace

The Federal Science DataHub is a powerful platform that provides **three main objectives for scientists and researchers**:

1. **The platform offers workspaces for storage, data processing, and analytics**. This means that you can store, process, and analyze your data in a secure cloud environment.

1. **DataHub offers a way to monitor your budget use and track expenses on a daily and monthly basis**. This helps you to keep track of your expenditures and stay within your budget limits.

1. **The Federal Science DataHub platform also provides a collaboration space for sharing data and python/r notebooks**. This allows you to work together with colleagues and peers from other government departments and agencies, share ideas, and improve your work efficiency.

## Metadata

To access the Azure resources provided by the Science Program DataHub, there is an important requirement that needs to be fulfilled for both Azure Storage (Use Case 1) and Azure Databricks (Use Case 2).

**You must complete the metadata** for your workspace in order to gain access to specific resources within the platform. This is a one-time requirement that will allow you to access the unified resources in Azure.

> Metadata is a set of data that describes and gives information about other data. In the context of the DataHub, metadata is used to describe the data and code that you store in your workspace.

## Collaborators

Datahub roles:

- lead
- administrator
- collaborator

Roles are also used in databricks for permissions.

In the Federal Science DataHub, there are three main roles that are used to manage access and permissions. These roles are as follows:

1. **The Workspace Lead** role is the highest level of access in a workspace. The workspace leads are the owners of the workspace and have the ability to manage and create resources, and can grant or revoke access for other users.

1. **The Workspace Administrator** role is responsible for managing the workspaces's resources, including data and metadata. Administrators can also manage user access, create cloud resources, and view budget usage reports.

1. **The Workspace Collaborator** role is designed for users who need to work on projects and contribute to research, but do not require full administrative access. Collaborators can access projects, upload data, and perform data analysis, but they cannot manage the workspace's resources or grant access to other users.

> It's worth noting that these roles are also used in Databricks for permissions. This means that the same roles apply when working with Databricks, ensuring that permissions and access are consistent across the platform.

> It can take a few minutes for the permissions to synchronize between the portal and Databricks. If you are unable to access databricks, please wait a few minutes and try again. If you are still unable to access databricks, please fill out a support request form.

## Azure Costing

The costing page on your workspace provides a comprehensive overview of all costs associated with using your cloud resources. This includes the backend costs of the workspace that are necessary to keep it running securely.

There are certain factors that can impact the cost of usage. I'll do a quick overview of what is expensive and what is not expensive when using the platform:

### What is expensive

- **Time spent on an active cluster** can be costly. This is because clusters require resources, such as CPU and memory, which are billed by the minute. Therefore, the longer a cluster is active and the larger it is, the more expensive it can become.

- **Large data transfers** can also be expensive. This includes both ingress and egress costs to move data from a user's computer up to Azure data centers or back down. These costs can add up quickly, especially for large datasets.

### What is not expensive

- **There is virtually no cost when the clusters are turned off** and notebooks are not running on active clusters. This means that users can save costs by turning off their clusters when not in use.

- **Keeping data within the Azure ecosystem** can also help to reduce costs. Most storage costs are incurred when data is uploaded or downloaded from Azure. If data is mounted and kept within the Azure ecosystem, there are minimal additional costs.

> **Out of credits**: We will not be giving more credits - it will be assessed on a case by case basis and we will be helping to move the data elsewhere if necessary. Please remember that the cost is shared amongst your collaborators.

## Managing Costs

The recommended approach to begin utilizing the DataHub effectively is to start with a small scale project and measure the associated costs for one week.

- **Select a small data set** that is representative of the larger data set to be used in the project. This small data set should be small enough to execute the algorithm on quickly, but large enough to provide a realistic representation of the larger data set.

- **Execute the algorithm on the small data set** and use the **first week** of working with it to establish a baseline for the project's costs. This will involve measuring the resources required to run the algorithm, such as CPU time, memory usage, and network bandwidth, as well as any associated costs, such as storage or data transfer costs.

- **Use a test week to estimate the costs for the longer term** after baseline has been established. This will provide a more accurate estimate of the overall costs of the project and can help to identify any potential cost-saving measures that can be implemented to reduce the overall cost of the project.

### Sample costs

We have run a few sample projects to demonstrate the costs associated with using the platform, and have found the for small datasets the costs are less than $70/week. For larger datasets, the costs can be more than $1000/day.

> These results are based on the costs incurred by the Science Program DataHub team, and are provided as a guide only.

- DIE1, DIE2, DIE3: less than $70/week
- NRC: large cluster, 300Gb Ram > $1000/day - cost mostly incurred because of extremely large cluster used.

# Section 2: Workspace Tools Overview

## What is Databricks

Databricks is a managed platform that provides support for Python and R notebooks and a standard Hadoop/Hive infrastructure for large data processing. The databricks platform separates the notebook and the infrastructure to execute the code. The code (SQL, Python and R) is executed on clusters and the structured SQL tables leverage standard Azure storage.

## How to upload your data to Azure and/or Databricks

One of the features available to both use cases is the **Storage Explorer**, which provides a user-friendly interface for managing cloud storage. This feature allows users to upload files and folders to Azure storage and download files from it as well. With this feature, users can manage their storage resources seamlessly, making it easier to access and manipulate data stored in the cloud.

> We assume that the data is available locally and can be uploaded to Azure. If the data is already on Azure please contact us to figure out a solution to limit egress and ingress costs.

Storage explorer:

- upload files and folders to azure
- download files

**There is a special path in Databricks known as the mount point**. The mount point is a virtual path that allows users to access their storage resources as if they were part of the Databricks file system.

> **The mount point for the storage account in Azure is `/mnt/fsdh-dbk-main-mount`**. This mount point provides access to the storage account, allowing users to read, write, and modify files stored in the Azure storage account using the standard file system commands in Databricks.

With this automatically configured, you can seamlessly access your data between the storage account in Azure and Databricks. Additionally, the mount point makes it possible for users to perform various data processing tasks such as data manipulation, cleaning, and analysis on data stored in the cloud without having to copy the data to the local machine or cluster.

## Built-in Documentation

One of the highlights of the Federal Science DataHub is the **built-in documentation**, which makes it easier to understand and navigate the platform's capabilities; some of these built-in documentation features include:

- **Uploading and downloading large files to storage using `azcopy`**. This feature is particularly useful for users who need to transfer large files between different storage locations or systems. Click on the "Generate Container Token" button to generate a token that can be used to access the storage account using the `azcopy` command line tool.

- **Databricks access and python/R resources**. This documentation provides a quick overview on how to access the storage mount and some links to the Databricks documentation.

> **Training**: Existing R and Python knowledge should be sufficient to work with the platform. Help with other databricks features will be provided on a case by case basis during available office hours.

## Cluster Selection

Cluster selection in Databricks has been contrainted to a selection of cost efficient execution nodes (note: node are using virtual machines in backend not accessible to the user).

## Python & R Libraries

- **Python:** Databricks provides access to [notebook scoped libraries](https://docs.databricks.com/libraries/notebooks-python-libraries.html) using special `%pip` command. No limitation on available libraries = pypip. Libraries that require native binaries might have some limitations.
- **R:** Databricks provides access to [notebook scoped libraries](https://docs.databricks.com/libraries/notebooks-r-libraries.html) as well using special `install.packages` command and `devtools::install_github` for github libraries. CRAN snapshots are recommended.

## Databricks SQL Storage

In addition to Python and R - Databricks provides access to standard Hive tables which enable to use SQL on managed files stored in Azure Storage Account. More details available in resources section.

## Demo notebook

Databricks can be used for:

- Data transformations, ETL
- Machine learning
- Visualizations
- Access to storage
- API access

## Additional Resources

Show resources in portal to learn more about databricks.
