# Demo Script for DataHub

## Section 0: Onboarding

Not sure we need to cover this...

## Section 1: Portal Overview

Provide an overview of the Science Program DataHub. Main objectives:
- workspaces for storage and processing
- access to storage 
- tracking of budget used (daily and monthly)
- collaboration space for sharing data and python/r notebooks

### T&C and Language

- Pre-requisite for entering the Portal. Quiz will be asked later to make sure every bullet has been read.
- Language can be switched inside the portal using the profile

### What is a workspace

Provide an overview of the Science Program DataHub. Main objectives:
- workspaces for storage and processing
- access to storage 
- tracking of budget used (daily and monthly)
- collaboration space for sharing data and python/r notebooks

### Metadata

Required to access the resources
Unified access to Azure Resources: Azure Storage (Use Case 1), Databricks for R and Python (Use Case 2)

### Collaborators

Datahub roles:
- administrator
- owner
- collaborator

Roles are also used in databricks for permissions.

### Azure Costing

Cost page includes all costs including backend

What is expensive:
- Time spent on the cluster
- Large data transfers (ingress + bandwitdth to go to Azure data centers from user computer)

What is not expensive:
- No cost when notebook is not used and cluster is turned off
- Keeping data in Azure = Hotel California. Most storage costs are incurred on uploading/downloading data out of Azure.

### Managing Costs

Recommended approach is to start using the DataHub with small scale project and measure costs for one week:
- select small data set
- execute algorithm on small dataset and use one week to establish baseline
- use test week to estimate costs on longer term

Example costs:
- DIE1, DIE2, DIE3: less than $70/week
- NRC: large cluster, 300Gb Ram > $1000/day - cost mostly incurred because of extremely large cluster used.

### Built-in Documentation

Highlights:
- Upload/download large files with `azcopy`
- List of databricks resources for python
- List of databricks resources for R

## Section 2: Python/R Environment Overview

### How to upload your data to Azure

Storage explorer:
- upload files and folders to azure
- download files

### Cluster Selection

Cluster selection in Databricks has been contrainted to a selection of cost efficient execution nodes (note: node are using virtual machines in backend not accessible to the user). 

### Python & R Libraries

- **Python:** Databricks provides access to [notebook scoped libraries](https://docs.databricks.com/libraries/notebooks-python-libraries.html) using special `%pip` command. No limitation on available libraries = pypip. Libraries that require native binaries might have some limitations.
- **R:** Databricks provides access to [notebook scoped libraries](https://docs.databricks.com/libraries/notebooks-r-libraries.html) as well using special `install.packages` command and `devtools::install_github` for github libraries. CRAN snapshots are recommended.

### Databricks SQL Storage

In addition to Python and R - Databricks provides access to standard Hive tables which enable to use SQL on managed files stored in Azure Storage Account. More details available in resources section.

### Demo notebook

Databricks can be used for:
- Data transformations, ETL
- Machine learning
- Visualizations
- Access to storage
- API access

### Additional Resources

Show resources in portal to learn more about databricks.
