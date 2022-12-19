# Configuration Options
These are settings in appsettings.json, or configured in the deployment environment, that are used by various features of DataHub.

## EmailNotification
These settings are used by the email notification system.

- **SmtpHost**, **SmtpPort**, **SmtpUsername**, and **SmtpPassword**: Define the SMTP server to use to send notifications.
- **SenderName** and **SenderAddress**: The display name and email address that the notifications will be sent from.
- **AppDomain**: The domain name and port where DataHub is deployed. This is used to generate links used in email notifications.
- **DevTestMode**: A boolean that toggles development mode. When in development mode, email notifications will be sent to the address specified in **DevTestEmail** instead of their original recipients, and the recipients will be appended to the email body.
- **DevTestEmail**: See above.

## PublicFileSharing
These settings are used to integrate with PowerBI to generate the approval form PDF for OpenData, and to specify the domain used for publicly shared links.

- **OpenDataApprovalPdfBaseUrl**: The base URL of the PowerBI approval form. E.g. https\://app.powerbi.com/groups/[groupId]/rdlreports/[reportId]
- **OpenDataApprovalPdfFormIdParam**: The parameter used to specify the approval form ID. As of this writing, the report uses the parameter "rp:p_approval_form_id"
- **PublicFileSharingDomain**: The domain used for publicly shared URLs.
- **OpenDataApproverName**: The name of the person or mailbox approving the Open Data sharing requests.
- **OpenDataApproverEmail**: Email of the person or mailbox approving the Open Data sharing requests. 

## HttpLogging
Enables or disables logging of HTTP requests for debug purposes. Should not be enabled in production.

- **Enabled**: Enables HTTP logging when true.
- **RequestHeaders** and **ResponseHeaders**: Comma separated lists indicating which request and response headers should be logged. Caution should be used with this, as there can be potentially sensitive data included in some of the headers. Headers not listed will appear with a question mark in the log.

## CKAN
These settings are used to interact with the CKAN API to publish shared files to the Open Data Registry.

- **BaseUrl**: API base URL. E.g. https\://registry-staging.open.canada.ca/en/api/3/action
- **AuthKey**: Authentication Key for the API. Find the value in the KeyVault _datahub-key-dev_ in a secret named: _ckan-authentication-key_.