## Resource Provisioner Functions

This guide will walk you through the steps to verify the installation of the Resource Provisioner Functions in your tenant and how to configure them.

## Prerequisites

You have completed the previous steps in the installation guide.

## Verify the infrastructure

### Create Graph User Function

1. Navigate to the Azure Portal and select the resource group that you created for the DataHub Core infrastructure
1. Select the `fsdh-func-res-prov-env` function app
1. Confirm that the function app is running
   - Verify it's on `dotnet-isolated` runtime
   - Verify it's on dotnet 7.x

### Configuration Table

The following table contains the configuration information for the DataHub Functions.

| Name                                                    | Description                                                            | Keyvault Secret Name                            | Value Example                                            |
| ------------------------------------------------------- | ---------------------------------------------------------------------- | ----------------------------------------------- | -------------------------------------------------------- |
| `FUNCTIONS_WORKER_RUNTIME`                              | The runtime of the DataHub Functions                                   | -                                               | `dotnet-isolated`                                        |
| `InfrastructureRepository__ApiVersion`                  | The API version of ADO                                                 | -                                               | `6.0`                                                    |
| `InfrastructureRepository__LocalPath`                   | The local path of the Infrastructure Repository                        | -                                               | `/../tmp/datahub-project-infrastructure-env`             |
| `InfrastructureRepository__MainBranch`                  | The main branch of the Infrastructure Repository                       | -                                               | `main`                                                   |
| `InfrastructureRepository__Password`                    | The password for the service account in ADO                            | `datahub-infrastructure-repo-password`          | `xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`               |
| `InfrastructureRepository__ProjectPathPrefix`           | The project path prefix of the Infrastructure Repository               | -                                               | `terraform/projects`                                     |
| `InfrastructureRepository__PullRequestBrowserUrl`       | The browser URL for the pull request in ADO                            | `datahub-infrastructure-repo-pr-browser-url`    | `https://dev.azure.com/...`                              |
| `InfrastructureRepository\_\_PullRequestUrl`            | The URL for the pull request in ADO                                    | `datahub-infrastructure-repo-pr-url`            | -                                                        |
| `InfrastructureRepository__Url`                         | The URL for the Infrastructure Repository                              | `datahub-infrastructure-repo-url`               | `https://dev.azure.com/...`                              |
| `InfrastructureRepository__Username`                    | The username for the service account in ADO                            | `datahub-infrastructure-repo-username`          | -                                                        |
| `InfrastructureRepository__AutoApproveUserOid`          | The object ID of the user that can auto approve pull requests          | `datahub-infrastructure-repo-auto-approver-oid` | `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`                   |
| `ModuleRepository__LocalPath`                           | The local path of the Module Repository                                | -                                               | `/../tmp/datahub-resource-modules`                       |
| `ModuleRepository__TemplatePathPrefix`                  | The template path prefix of the Module Repository                      | -                                               | `templates/`                                             |
| `ModuleRepository__Url`                                 | The URL for the Module Repository                                      | -                                               | `https://github.com/ssc-sp/datahub-resource-modules.git` |
| `ResourceRunRequestConnectionString`                    | The connection string for the storage account                          | `datahub-storage-queue-conn-str`                | `DefaultEndpointsProtocol=https...`                      |
| `Terraform__Backend__ResourceGroupName`                 | The resource group name of the storage account to hold terraform state | -                                               | `fsdh-env-rg`                                            |
| `Terraform__Variables__az_location`                     | The location of the resources                                          | -                                               | `canadacentral`                                          |
| `Terraform__Variables__az_subscription_id`              | The subscription ID of the resources                                   | -                                               | `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`                   |
| `Terraform__Variables__az_tenant_id`                    | The tenant ID of the resources                                         | -                                               | `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`                   |
| `Terraform__Variables__azure_databricks_enterprise_oid` | The object ID of the Databricks Enterprise                             | `datahub-databricks-sp`                         | `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`                   |
| `Terraform__Variables__common_tags`                     | The common tags for the resources                                      | -                                               | `{"environment":"dev","owner":"datahub"}`                |
| `Terraform__Variables__datahub_app_sp_oid`              | The object ID of the DataHub App Service Principal                     | -                                               | `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`                   |
| `Terraform__Variables__environment_classification`      | The environment classification of the resources                        | -                                               | `U`                                                      |
| `Terraform__Variables__environment_name`                | The environment name of the resources                                  | -                                               | `dev`                                                    |
| `Terraform__Variables__resource_prefix`                 | The resource prefix of the resources                                   | -                                               | `fsdh`                                                   |

### Setting Key Vault Secrets

1. Navigate to the Azure Portal and select the resource group that you created for the DataHub Core infrastructure
1. Select the `fsdh-kv-env` Key Vault
1. Confirm that the following secrets are present
   - [ ] `datahub-databricks-sp`
   - [ ] `datahub-infrastructure-repo-password`
   - [ ] `datahub-infrastructure-repo-pr-browser-url`
   - [ ] `datahub-infrastructure-repo-pr-url`
   - [ ] `datahub-infrastructure-repo-url`
   - [ ] `datahub-infrastructure-repo-username`
   - [ ] `datahub-storage-queue-conn-str`

### Sample script

Log in with the service principal that you created in the previous steps.

```powershell
az login --service-principal --username $servicePrincipalId --password $servicePrincipalPassword --tenant $tenantId
```

Set the keyvault secrets

```powershell
$keyVaultName = "fsdh-key-env"

az keyvault secret set --vault-name $keyVaultName --name "datahub-databricks-sp" --value "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
az keyvault secret set --vault-name $keyVaultName --name "datahub-infrastructure-repo-password" --value "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
az keyvault secret set --vault-name $keyVaultName --name "datahub-infrastructure-repo-pr-browser-url" --value "https://dev.azure.com/..."
az keyvault secret set --vault-name $keyVaultName --name "datahub-infrastructure-repo-pr-url" --value "https://dev.azure.com/..."
az keyvault secret set --vault-name $keyVaultName --name "datahub-infrastructure-repo-url" --value "https://dev.azure.com/..."
az keyvault secret set --vault-name $keyVaultName --name "datahub-infrastructure-repo-username" --value "..."
az keyvault secret set --vault-name $keyVaultName --name "datahub-infrastructure-repo-auto-approver-oid" --value "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
az keyvault secret set --vault-name $keyVaultName --name "datahub-storage-queue-conn-str" --value "DefaultEndpointsProtocol=https..."
```
