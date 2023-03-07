# Installing DataHub in your tenant

This guide will walk you through the steps to install DataHub in your tenant.

## Prerequisites

- [ ] You have a tenant in your Azure Active Directory (Azure AD) where you want to install DataHub.
- [ ] You have (or access to someone with) the Administrator role in your Azure AD tenant.
- [ ] You have (or access to someone with) the Administrator role in your Azure subscription.
- [ ] You have (or access to someone with) the Administrator role in your Azure DevOps organization.

## Step 0: Preparation

Before you can install DataHub, you need to configure your landing zone. Ensure that you know the following information before you start the installation process:

### Infrastructure

- [ ] Azure Tenant ID (GUID)
- [ ] Azure Subscription ID (GUID)
- [ ] Azure AD Domain Name (e.g. contoso.com)
- [ ] Custom Domain Name (e.g. datahub.com)
- [ ] Azure AD Group name for application admins (e.g. DataHub Admins)
- [ ] Azure AD Group name for application DBAs (e.g. DataHub DBAs)
- [ ] Azure AD Group name for application users (e.g. DataHub Users)
- [ ] Public domain DNS for external access (e.g. external.datahub.com)
- [ ] Whether you want to use MSI authentication for Databricks provider (e.g. run from Azure DevOps)
- [ ] Databricks Enterprise Object ID (GUID)
- [ ] Cosmos DB Enterprise Object ID (GUID)

### Portal

- [ ] Azure Resource Group Name
- [ ] Resource Prefix (e.g. fsdh)
- [ ] Main Key Vault Name & ID
- [ ] Email of the support contact
- [ ] PowerBI URL SPI (e.g. https://api.powerbi.com/v1.0/myorg)
- [ ] PowerBI PDF Viewer URL (e.g. https://app.powerbi.com/viewer)

### SMTP

- [ ] SMTP Host Name
- [ ] SMTP Port
- [ ] SMTP Sender Name
- [ ] SMTP Sender Email

### OpenData

- [ ] OpenData Approver Name
- [ ] OpenData Approver Email
- [ ] OpenData API URL (e.g. https://api.data.gov.sg/v1/environment/2-hour-weather-forecast)

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

## Step 2: Configure your DataHub (Core) infrastructure

1. Clone the DataHub (Core) infrastructure repository into your local machine.
1. Create a new branch for your changes.

1. Run `terraform init` to initialize the terraform backend.
1. Run `terraform plan` to ensure that the infrastructure is configured correctly.

### Create the DataHub (Projects) infrastructure repository

1. Create a new repository in your Azure DevOps organization.
1. Identify the folder structure that you want to use for your projects. We recommend using the following structure:

```bash
└───terraform
    ├───core
    │   ├───dev
    │   │   ├───main.tf
    │   │   ├─── ...
    │   │   └───terraform.tfvars
    │   ├───prod
    │   │   ├───main.tf
    │   │   ├─── ...
    │   │   └───terraform.tfvars
    │   └───staging
    │       ├───main.tf
    │       ├─── ...
    │       └───terraform.tfvars
    └───projects
        ├───ACRONYM1
        │   ├───main.tf
        │   ├─── ...
        │   └───project.tfbackend
        ├───ACRONYM2
        │   ├───main.tf
        │   ├─── ...
        │   └───project.tfbackend
        └─── ...

```

> Note: The `ACRONYM` is the acronym of the project. For example, the acronym for the `Science Alpine Experimentation Project` would be `SAEP`.
