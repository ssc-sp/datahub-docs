## Datahub Functions

This guide will walk you through the steps to verify the installation of the DataHub Functions in your tenant and how to configure them.

## Prerequisites

You have completed the previous steps in the installation guide.

## Verify the infrastructure

### Create Graph User Function

1. Navigate to the Azure Portal and select the resource group that you created for the DataHub Functions
1. Select the `fsdh-func-dotnet-env` function app
1. Confirm that the function app is running
1. Verify the CreateGraphUser function by navigating to the `CreateGraphUser` function
   1. Select the Overview tab
   1. Click the `Get Function Url` button
   1. Verify that the function URL matches the value of the core infrastructure AKV's secret `datahub-create-graph-user-url`

### Configuration Table

The following table contains the configuration information for the DataHub Functions.

| Name                               | Description                                                          | Keyvault Secret Name             | Value Example                          |
| ---------------------------------- | -------------------------------------------------------------------- | -------------------------------- | -------------------------------------- |
| `datahub-mssql-project`            | The connection string of the SQL database for the DataHub Projects   | -                                | `Server=tcp:...`                       |
| `DatahubStorageConnectionString`   | The connection string for the storage account                        | `datahub-storage-queue-conn-str` | `DefaultEndpointsProtocol=https...`    |
| `EmailNotification__SenderAddress` | The email address of the sender                                      | -                                | -                                      |
| `EmailNotification__SenderName`    | The name of the sender                                               | -                                | -                                      |
| `EmailNotification__SmtpHost`      | The SMTP host                                                        | -                                | -                                      |
| `EmailNotification__SmtpPassword`  | The SMTP password                                                    | `datahub-smtp-password`          | -                                      |
| `EmailNotification__SmtpPort`      | The SMTP port                                                        | -                                | -                                      |
| `EmailNotification__SmtpUsername`  | The SMTP username                                                    | `datahub-smtp-username`          | -                                      |
| `FUNC_SP_CLIENT_ID`                | The client ID of the service principal for the DataHub Functions     | `datahubportal-client-id`        | -                                      |
| `FUNC_SP_CLIENT_SECRET`            | The client secret of the service principal for the DataHub Functions | `datahubportal-client-secret`    | -                                      |
| `FUNCTIONS_WORKER_RUNTIME`         | The runtime of the DataHub Functions                                 | -                                | `dotnet-isolated`                      |
| `PORTAL_URL`                       | The URL of the DataHub Portal                                        | -                                | -                                      |
| `ProjectUsageCRON`                 | The CRON expression for the ProjectUsage function                    | -                                | `0 0 2 * * *`                          |
| `ProjectUsageNotificationPercents` | The percentages for the ProjectUsageNotification function            | -                                | `25,50,80,100`                         |
| `QueueEmailNotification`           | The name of the email notification queue                             | -                                | `email-notification`                   |
| `QueueProjectUsageNotification`    | The name of the project usage notification queue                     | -                                | `project-usage-notification`           |
| `QueueProjectUsageUpdate`          | The name of the project usage update queue                           | -                                | `project-usage-update`                 |
| `SP_GROUP_ID`                      | The OID of the group for the datahub users in AAD                    | -                                | `00000000-0000-0000-0000-000000000000` |
| `SUBSCRIPTION_ID`                  | The subscription ID of the DataHub Functions                         | -                                | `00000000-0000-0000-0000-000000000000` |
| `TENANT_ID`                        | The tenant ID of the DataHub Functions                               | -                                | `00000000-0000-0000-0000-000000000000` |
