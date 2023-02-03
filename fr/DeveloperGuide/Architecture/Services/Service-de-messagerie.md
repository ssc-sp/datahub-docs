---
remarks: Automatically translated with DeepL
source: /DeveloperGuide/Architecture/Services/Email-Service.md
---

_(draft documentation, please review)_

# Service de courrier électronique

## Aperçu

Le service de messagerie est un microservice qui est responsable de l'envoi de courriels aux utilisateurs. Il consomme les messages de la file d'attente `email` et envoie les emails aux utilisateurs.

> Note : La file d'attente des messages empoisonnés peut être consultée par la section d'administration du portail. Cela permet à l'administrateur de voir les messages qui ont été envoyés dans la file d'attente des messages empoisonnés.

## Format du message

Le format du message pour la file d'attente `email` est le suivant :

```
{
    "à" : Liste<string>,
    "sujet" : String,
    "corps" : Chaîne de caractères

    // Facultatif
    "cc" : Liste<string>,
    "bcc" : Liste<string>,
    "pièces jointes" : Liste<string> // à envoyer sous forme de chaînes codées en base64


    "template" : String // si le modèle est défini, le corps sera ignoré et le modèle sera utilisé à la place.
    "templateData" : Object // sérialisé en JSON et passé au modèle
}
```

## Modèles

Le service de messagerie utilise [Handlebars] (https://handlebarsjs.com/) pour rendre les modèles. Les modèles sont stockés dans le dossier `Templates`. La DTO du modèle est sérialisée en JSON et transmise au service. Le modèle peut alors accéder aux propriétés de la DTO en utilisant la syntaxe `{{property}}`.

## Configuration

Le service de messagerie est configuré à l'aide du fichier `appsettings.json`. Les paramètres suivants sont disponibles :

```json
{
  "EmailService" : {
    "SmtpServer" : "smtp.gmail.com",
    "SmtpPort" : 587,
    "SmtpUsername" : "username",
    "SmtpPassword" : "password",
    "FromAddress" : ""
  }
}
```

## Test

Le service de messagerie peut être testé en envoyant un message à la file d'attente `email`. Le message suivant peut être utilisé :

```json
{
  "à" : ["your@email.com"],
  "subject" : "Test Email",
  "body" : "Ceci est un email de test"
}
```

## Dépannage

Si le service de messagerie n'envoie pas d'e-mails, les étapes suivantes peuvent être suivies pour résoudre le problème :

1. Vérifiez les journaux pour voir s'il y a des erreurs.
1. Vérifiez la file d'attente des messages de poison pour voir si le message est envoyé dans la file d'attente des messages de poison
1. Vérifiez le fichier `appsettings.json` pour vous assurer que les paramètres sont corrects.
1. Vérifiez le fichier `appsettings.json` pour vous assurer que le paramètre `FromAddress` est défini sur une adresse email qui est autorisée à envoyer des emails.
1. Vérifiez le fichier `appsettings.json` pour vous assurer que le `SmtpUsername` et le `SmtpPassword` sont définis
1. Vérifiez le fichier `appsettings.json` pour vous assurer que les paramètres `SmtpServer` et `SmtpPort` sont correctement définis.
1. Vérifiez le fichier `appsettings.json` pour vous assurer que le `SmtpServer` et le `SmtpPort` ne sont pas bloqués par un pare-feu, un filtre anti-spam, un filtre de sécurité, un proxy, un VPN, un routeur ou un filtre DNS.

## Références

- [Handlebars](https://handlebarsjs.com/)
- [Handlebars - Getting Started](https://handlebarsjs.com/guide/)
- [RabbitMQ](https://www.rabbitmq.com/)
- [RabbitMQ .NET Client](https://www.rabbitmq.com/dotnet.html)
- [RabbitMQ .NET Client - Démarrage] (https://www.rabbitmq.com/dotnet.html#dotnet-getting-started)
- [RabbitMQ .NET Client - Référence API](https://www.rabbitmq.com/dotnet-api-guide.html)

## Sujets connexes

- [Architecture](../Architecture.md)
- [Services](../Services.md)
- [RabbitMQ](../RabbitMQ.md)
