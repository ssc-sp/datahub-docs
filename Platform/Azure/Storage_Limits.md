# Overview of Storage Alerts

## Failsafe with 110% usage

Azure Action groups will be used to lock or disable the account. Leverage the alert system.

Needs to be investigated

Failsafe can implemented in Terraform See [Azure Metric Alert](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert)

## User warning system

Email warnings will be sent to the users at the following thresholds:

- 50% usage
- 80% usage
- 90% usage

A separate function _storage monitor_ will be triggered on a daily basis, leverage the existing service principal authentication to the Azure API to capture the overall storage capacity for each storage account.

The output will be stored in the portal database.

## Email notifications

A third function _email processor_ will leverage queues and send emails to the users.

