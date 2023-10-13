# Migrate FSDH workspaces to versioned modules

# Prepare
1. Login to Azure
2. Change directory to the project directory
3. Run the following:
    ```
    terraform state rm module.azure_databricks_module.databricks_user.datahub_dbk_user
    terraform state rm module.azure_databricks_module.databricks_group_member.datahub_dbk_admin_member
    terraform state rm module.azure_databricks_module.databricks_group_member.datahub_dbk_lead_member
    terraform state rm module.azure_databricks_module.databricks_group_member.datahub_dbk_all_member
    terraform state rm module.azure_storage_blob_module.azurerm_role_assignment.storage_contributor_assignment
    terraform state rm module.azure_storage_blob_module.azurerm_role_assignment.storage_reader_assignment     
    ```
# Upgrade
1. Get the old project config (FSDH > Workspaces > search for and open workspace > View commands)
2. Update version to the desired version: (e.g. `"Version": "v2.13.0",`)
3. Enqueue the updated config to the queue: `resource-run-request`
4. Monitor the ADO release pipeline poc-fsdh-rp
