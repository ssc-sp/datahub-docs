## Welcome

> DataHub is a portal and backend to support analytics and cloud storage

## Terraform resource provisioner

Portal provides a way for users to request resources which are deployed through terraform modules in devops pipelines. Workspace resources are managed through terraform modules that are pushed to git repositories and deployed from devops pipelines. 
- [x] DataHub follows standard devops processes
- [x] Changes to infrastructure go through pull requests and reviews
- [x] Repository of standard terraform modules can be easily extended using Terraform modules
- [x] Storage, Databricks and Virtual Machines modules are available
- [x] User permissions can be synchronized between resources and workspaces

## Open Source Data Catalog

Workspaces, files, reports, databricks workspaces and databases can be added to the built-in data catalog.
- [x] Catalog is based on Dublin Core standard
- [x] Open Data open.canada.ca standards are built-in
- [x] Hierarchical Metadata model can streamline tagging of workspace artifacts

## Storage Explorer

Workspace provide interface to easily upload data to cloud storage account
- [x] Modern storage explorer with file + directory upload
- [x] Token generator for integration with external tools
- [x] Experimental desktop tool based on electron for large data uploads

## Integrated analytics with Power BI

Power BI workspaces can be linked to DataHub workspaces
- [x] Easy governance of dashboards through Production and Development workspaces
- [x] Cataloging of dashboards and datasets
- [x] English and French dashboards can be linked into single entities

## Data entry framework and business workflow

Modules can be developed and leverage existing components
- [x] Form generation from DotNet Entity Framework entities
- [x] Modules can be linked to workspaces

## Integrated Documentation System

Docsify based documentation is integrated in the portal
- [x] Translation module can leverage online translation services to generate drafts
- [x] Markdown is rendered inside the portal to leverage existing web components


## Modular and Open

DataHub portal is modular and its deployment can be customized
- [x] Leverages modern web components for improved accessibility and adaptive layout
- [x] Features can be disabled
- [x] Content can be customized using profiles
- [x] Extensive configuration options


