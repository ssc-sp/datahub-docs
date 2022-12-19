# DataHub Data Project

Data Projects in DataHub feature a simple model to simplify the onboarding of new users to specific tools in a data project.

## Request access to resource

The Data Projects workflow let users request access to:
- Project specific Databricks workspace (*)
- Project specific WebForm
- Project specific PowerBI workspace (*)

Access request to resources is open to all NRCan users.

If a user needs access to one of those service it can result in the following two workflows (only for resources *):
- **Workflow 1:** Request for resource creation. This request will be reviewed by the DataHub team and if approved, a resource will be added to the system Terraform and deployed on the next system update.
- **Workflow 2:** Request access to an existing resource. If approved by the project administrators, the DataHub system automation will add the user to the resource with limited access. Additional ACL for the resource access need to be managed within the resource itself.
 
## Project Owners

Each data project has a list of project owners. That list of project owners is maintained by the project owners of the DataHub project tracker which includes the key members of DataHub.

The project owners consists of a list of Azure usernames and lets user approve other user access to a resource (see list above).
