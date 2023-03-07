# DataHub Configuration

This section contains the configuration information for DataHub.

## Infrastructure

### Storage Queues

The storage queues are all created in the same storage account which is created by the DataHub Core infrastructure. The connection string for the storage account is assigned to the `DatahubStorageConnectionString` variable in the configuration.

The following storage queues are used by DataHub:

| Name                          | Description                                |
| ----------------------------- | ------------------------------------------ |
| `email-notifications`         | Queue for DataHub emails                   |
| `email-notifications-poison`  | Queue for failed DataHub emails            |
| `resource-run-request`        | Queue for DataHub resource runs            |
| `resource-run-request-poison` | Queue for failed DataHub resource runs     |
| `storage-capacity`            | Queue for DataHub storage capacity         |
| `storage-capacity-poison`     | Queue for failed DataHub storage capacity  |
| `terraform-output`            | Queue for DataHub Terraform outputs        |
| `terraform-output-poison`     | Queue for failed DataHub Terraform outputs |

## Resource Provisioner Secrets

The following secrets are used by the Resource Provisioner:

| Name                                         | Description                                       |
| -------------------------------------------- | ------------------------------------------------- |
| `datahub-infrastructure-repo-password`       | InfrastructureRepository\_\_Password              |
| `datahub-infrastructure-repo-pr-browser-url` | InfrastructureRepository\_\_PullRequestBrowserUrl |
| `datahub-infrastructure-repo-pr-url`         | InfrastructureRepository\_\_Url                   |
| `datahub-infrastructure-repo-username`       | InfrastructureRepository\_\_Username              |
| `datahub-storage-queue-conn-str`             | ResourceRunRequestConnectionString                |
| `datahub-databricks-sp`                      | Terraform\_\_Variables\_\_az_databricks_sp        |
