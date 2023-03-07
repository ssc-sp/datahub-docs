## Step 1: Create your infrastructure repositories

We use Azure DevOps to manage our infrastructure but there is no reason why you can't use a different git repository. You will need to create two repositories:

> Note: If you don't have an Azure DevOps organization, you can create one by following the instructions in [this guide](https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/create-organization?view=azure-devops).

- [ ] One for the DataHub (Core) infrastructure
- [ ] One for the DataHub (Projects) infrastructures

> Note: You can use two separate repositories for both the DataHub (Core) and DataHub (Projects) infrastructures. However, we recommend that you use a single infrastructure repository.

### Create the DataHub infrastructure template repository

1. Clone the Datahub Infrastructure repository into a new repository in your Azure DevOps organization.
1. Configure your terraform backend however you wish. We recommend using Azure Storage as the backend.
1. Copy the `terraform.tfvars.example` file to `terraform.tfvars` and update the values with your own.
1. Run `terraform init` to initialize the terraform backend.
1. Run `terraform plan` to ensure that the infrastructure is configured correctly.
1. Run `terraform apply` to deploy the infrastructure.
