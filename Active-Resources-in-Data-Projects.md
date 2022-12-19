# Objective

Retrieve list of active resources for a project using project ID.

## Required attributes

- Resource URL (databricks or storage account)
- Resource type (key?)
- Resource attributes

## Update Process

1. Terraform executes update in DevOps pipeline
1. Terraform generates output file with variables
1. Pipeline uploads output file in Storage Queue
1. TerraformOutputService polls Storage Queue
1. TerraformOutputService iterates through generated resource
   1. For each resource
   1. TerraformOutputService parses Terraform Values into ProjectResource object model
   1. ProjectResource is serialized into JSON and stored in DB with Project ID, `module name` as key including git commit id from azure devops pipeline

> _Note: `module name` needs to exactly match the git repository in the github folder with modules. The description will be retrieved from `https://github.com/ssc-sp/datahub-resource-modules/tree/develop/modules/<module name>/datahub.readme.md`_
