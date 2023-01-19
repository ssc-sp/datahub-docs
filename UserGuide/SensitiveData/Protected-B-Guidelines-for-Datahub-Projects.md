---
onProfileInclude: nrcan
---

# Databricks

## Hive tables vs SQL Server and Cosmos DB.

Datahub does not support storage of Protected B information in Hive tables for the following reasons:
- Access Control depends on the underlying storage account and is complex to integrate with Hive permissions
- Auditing of access in Hive tables is not possible and is required for Protected B data

## SQL Server and Cosmos DB

Datahub configured SQL Server and Cosmos DB databases are recommended for the storage of Protected B data.

## Workspace Objects Access Control
Use Groups to manage granular permission (read vs write) and grant access to folders/notebooks using the groups to ensure 

## Cluster Level Access Control
Use Groups to manage permission for configuring, attaching, and restarting the clusters and grant permission at the cluster level using the groups

## Secrete Management
Use the Azure Key Vault that has been specifically assigned to the project to manage secrets (password, tokens, certificates etc.) that will be used within the Databricks notebooks and use Secret Scope to access them
- Secure the Secrete Scope to ensure that only the approved users have access to it
- Secure the key vault using Active Directory permission to ensure only the users that require access to the key vault for that project have access to it

## Accessing Azure Storage Account
Any clusters that access the storage account must be configured with "Credential Passthrough" so that the Databricks users' AD credential will be validated against the ACL of the storage account to ensure the access is secure
Only use Gen2 Blob Storage Account with Hierarchical Namespace enabled 
- This is required to ensure the "Credential Passthrough" feature can be used for accessing the storage account


