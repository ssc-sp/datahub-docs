## (Public) Infrastructure Repo

The public infrastructure repository is used to store the templates and modules that are used to create the workspace infrastructure.

```
root/
  templates/
    new-workspace-template/             // workspace base
    azure-blob-storage/               // features
    databricks-workspace/
    ..
    azure-blob-storage-users/         // user syncs
    databricks-workspace-users/
    ..

  modules/
    azure-storage/
      main.tf                         // includes metadata to drive ui
      ..
    azure-databricks/
    ..
```

## (Private) Infrastructure Repo

The eventual layout of the private infrastructure will contain a folder for each workspace, with `.tf` files, a `variables.tfvars` file, and a `values.json` file.

The workspace directory's `.tf` files will contain the modules for the workspace, and the `variables.tfvars` file will contain the variables that are required for the modules.

The `values.json` file will contain the values for the variables in the `variables.tfvars` file. The `values.json` file will be encrypted using the [Azure Key Vault](https://docs.microsoft.com/en-us/azure/key-vault/general/basic-concepts) and the [Azure Key Vault Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_key_vault) for Terraform.

## Workspace Subdirectories Layout

```
root/
  terraform/
    WRK1/
      main.tf
      variables.tfvars
      values.json
      feature-1.tf
      feature-4.tf
      ..
    WRK2/
      main.tf
      variables.tfvars
      values.json
      feature-7.tf
      feature-10.tf
      feature-11.tf
      ..
    WRK3/
    WRK4/
    WRK5/
    ..
```

## Feature Modification Example

```
root/
  terraform/
    WRK1/
      main.tf
      ~~ variables.tfvars
      ~~ values.json
      feature-1.tf
      feature-4.tf
      ++ storage-module-<id>.tf
```
