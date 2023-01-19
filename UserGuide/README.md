# User Guide to DataHub

## Data Projects

The DataHub makes it easy for multiple teams, labs or users to get access to Storage, Databases, Data Science and Analytical tools:

- Storage accounts: A Data Project includes a storage explorer to upload/download files with a friendly user interface.
- Databricks integration: The Data Project has a direct link to Databricks workspaces and also simplifies the mounting of the storage account for the notebooks
- Power BI integration: The integration implements NRCan's governance model and connects users directly to their workspaces and key reports.
- PostgreSQL: Postgresql servers can also be linked and the project tools can generate the associated Azure token for integrated authentication.
- Data Sharing: A simple workflow lets users select a file, and request data sharing (see Data Sharing for more details)
- User onboarding: Project administrators can invite other users to their project(s)

### User Management

The portal integrates with Azure Active Directory and manages roles and users. The portal has 3 types of users: Datahub administrators, Project administrators and Users. Users can access project resources, project administrators can invite other users and datahub administrators have the ability to invite administrators.

### Resource Management

The portal is designed to be used with Terraform or other IaC systems and automate the creation of resources. The system manages a list of workflows with user requests in SQL tables that can be integrated in DevOps pipelines. 

### Secure by default

Each component in the system has been designed with high security in mind. The portal doesn't require any elevated Azure role or service principal and uses OBO permissions for all management tasks.

### Integrated help

The key pages and modules in the portal offer integrated help for guiding users with Power BI, Databricks, and Azure Storage. The current help content is located in the Wiki.

### Data Entry Framework

The portal includes a data entry framework that leverages Entity Framework, fluent code, annotations and can generate complex forms to support client business rules, multiple tables through standard SQL tables. This model enables an easy integration in Power BI or Tableau.

## Technology

The Web Portal is developed in .NET 7 and uses Blazor and ASP.Net core and several other open source libraries. The portal can run on Windows, Linux and can be deployed in any cloud environment. The styling leverages SCSS to modularize the CSS settings.

## Extensibility & Configuration

Several customizations can be done simply using the configuration. Each module in the data project can be enabled or disabled in the configuration.

The DataHub is divided into modules which connect together using the ASP.Net core IoC broker. This enables to add extensions through nuget packages or separate projects. All modules are automatically wired to the portal using assembly scanning. Each module can be disabled using the configuration files.
