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
