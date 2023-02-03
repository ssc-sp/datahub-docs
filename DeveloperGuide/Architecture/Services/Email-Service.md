# Email Service

## Overview

The Email Service is a microservice that is responsible for sending emails to users. It consumes messages from the `email` queue and sends emails to the users.

> Note: The poison message queue is peeked at by the portal's admin section. This allows the admin to see the messages that have been sent to the poison message queue.

## Message Format

The message format for the `email` queue is as follows:

```
{
    "to": List<string>,
    "subject": String,
    "body": String

    // Optional
    "cc": List<string>,
    "bcc": List<string>,
    "attachments": List<string>     // to be sent as base64 encoded strings


    "template": String              // if template is set, the body will be ignored and the template will be used instead
    "templateData": Object          // serialized to JSON and passed to the template
}
```

## Templates

The Email Service uses [Handlebars](https://handlebarsjs.com/) to render templates. The templates are stored in the `Templates` folder. The template DTO is serialized to JSON and passed to the service. The template can then access the properties of the DTO using the `{{property}}` syntax.

## Configuration

The Email Service is configured using the `appsettings.json` file. The following settings are available:

```json
{
  "EmailService": {
    "SmtpServer": "smtp.gmail.com",
    "SmtpPort": 587,
    "SmtpUsername": "username",
    "SmtpPassword": "password",
    "FromAddress": ""
  }
}
```

## Testing

The Email Service can be tested by sending a message to the `email` queue. The following message can be used:

```json
{
  "to": ["your@email.com"],
  "subject": "Test Email",
  "body": "This is a test email"
}
```

## Troubleshooting

If the Email Service is not sending emails, the following steps can be taken to troubleshoot the issue:

1. Check the logs to see if there are any errors
1. Check the poison message queue to see if the message is being sent to the poison message queue
1. Check the `appsettings.json` file to ensure that the settings are correct
1. Check the `appsettings.json` file to ensure that the `FromAddress` is set to an email address that is allowed to send emails
1. Check the `appsettings.json` file to ensure that the `SmtpUsername` and `SmtpPassword` are set
1. Check the `appsettings.json` file to ensure that the `SmtpServer` and `SmtpPort` are set correctly
1. Check the `appsettings.json` file to ensure that the `SmtpServer` and `SmtpPort` are not blocked by a firewall, spam filter, security filter, proxy, VPN, router, or DNS filter

## References

- [Handlebars](https://handlebarsjs.com/)
- [Handlebars - Getting Started](https://handlebarsjs.com/guide/)
- [RabbitMQ](https://www.rabbitmq.com/)
- [RabbitMQ .NET Client](https://www.rabbitmq.com/dotnet.html)
- [RabbitMQ .NET Client - Getting Started](https://www.rabbitmq.com/dotnet.html#dotnet-getting-started)
- [RabbitMQ .NET Client - API Reference](https://www.rabbitmq.com/dotnet-api-guide.html)

## Related Topics

- [Architecture](../Architecture.md)
- [Services](../Services.md)
- [RabbitMQ](../RabbitMQ.md)
