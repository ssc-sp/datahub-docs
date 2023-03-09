# Approving Workspaces

## Pull Requests

New workspaces will generate a pull request inside the DevOps. 

Opening the [DevOps Active Pull Requests for Dev](https://dev.azure.com/science-program/DataHub%20SSC/_git/datahub-project-infrastructure-dev/pullrequests?_a=active) or [DevOps Active Pull Requests for Int](https://dev.azure.com/science-program/DataHub%20SSC/_git/datahub-project-infrastructure-int/pullrequests?_a=active) will list all the infrastructure changes requested. 

## Pipelines

Once the PR is approved, it will trigger the Terraform pipelines:

### Dev

The terraform pipeline is called [`fsdh-dev-project-release-v0.1.x`](https://dev.azure.com/science-program/DataHub%20SSC/_release?definitionId=22&view=mine&_a=releases)

### Int

The terraform pipeline is called [`fsdh-release-int-v1.1.x`](https://dev.azure.com/science-program/DataHub%20SSC/_release?_a=releases&view=mine&definitionId=23)