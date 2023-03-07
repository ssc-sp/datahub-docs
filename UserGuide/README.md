# FSDH Platform Overview - High-level

## Workspaces

The FSDH Workspace makes it easy for multiple teams, labs or users to get access to Storage and Analytical tools:

- Storage accounts: a Workspace includes a Storage Explorer to upload/download files with a user friendly interface. AzCopy is used for command line interface to upload very large datasets.
- Databricks integration: the Workspace has a direct link to Databricks workspaces and also simplifies the mounting of the storage account for the notebooks
- CONFIRM THIS IS CORRECT Data Sharing: A simple workflow lets users select a file, and request data sharing (see Data Sharing for more details)
- User onboarding: Project administrators can invite other users to their Workspace(s)

### User Management

The FSDH Portal integrates with Azure Active Directory and manages roles and users. The portal has 2 types of users: 
- Users can access Workspace resources 
- Workspace Leads (Admin) can invite other users and assign roles 

### Resource Management

The FSDH Portal is designed to be used with Terraform or other IaC systems and automate the creation of resources. The system manages a list of workflows with user requests in SQL tables that can be integrated in DevOps pipelines. 

### Secure by default

Each component in the system has been designed with high security in mind. The FSDH Portal does not require any elevated Azure role or service principal and uses OBO permissions for all management tasks.

### Integrated help

The key pages and modules in the FSDH Portal offer integrated help for guiding users with Azure Storage and Databricks. The current help content is located in the github Wiki.

### Data Entry Framework

The FSDH Portal includes a data entry framework that leverages Entity Framework, fluent code, annotations and can generate complex forms to support client business rules, multiple tables through standard SQL tables. This model enables an easy integration in Power BI or Tableau.

## Technology

The FSDH Web Portal is developed in .NET 7 and uses Blazor and ASP.Net core and several other open source libraries. The FSDH portal can run on Windows, Linux and can be deployed in any cloud environment. The styling leverages SCSS to modularize the CSS settings.

## Extensibility and Configuration

Several customizations can be done simply using the configuration. Each module in the data project can be enabled or disabled in the configuration.

The FSDH  is divided into modules which connect together using the ASP.Net core IoC broker. This enables to add extensions through nuget packages or separate projects. All modules are automatically wired to the portal using assembly scanning. Each module can be disabled using the configuration files.
