---
remarks: Automatically translated with DeepL
source: /DeveloperGuide/Azure/Credits_and_notifications.md
draft: true
---

# Aperçu des coûts et de la notification du projet

## Sécurité intégrée à 100% d'utilisation du budget basée sur

Les groupes d'action Azure seront utilisés pour verrouiller ou désactiver le compte. Tirez parti du système d'alerte.

## Diagramme de mise à jour et de notification de l'utilisation des crédits du projet

Une fonction programmée CRON s'exécutera chaque matin (2h00) et déclenchera le processus d'utilisation du crédit.

Les crédits du projet sont récupérés en utilisant l'API de gestion Azure. Une fonction Azure sera chargée de collecter quotidiennement les coûts et l'utilisation par service.

Une autre fonction vérifiera les crédits utilisés et informera les parties prenantes de l'espace de travail (par courrier électronique) à 25 %, 50 %, 80 % et 100 % du budget attribué.

Pour mettre en œuvre ce processus en toute sécurité, un ensemble de files d'attente et de fonctions sera utilisé :

## Queues
- mise à jour de l'utilisation du projet
- notification d'utilisation du projet
- notification par courriel

## Fonctions
- Planificateur d'utilisation des projets
- Mise à jour de l'utilisation du projet
- Notificateur d'utilisation de projet
- Gestionnaire de notification par courriel

### Diagramme de mise à jour et de notification de l'utilisation des crédits

``mermaid``
 diagramme de séquence
    participant SF comme fonction de planification
    participant UQ comme File d'attente de mise à jour
    participant UF comme fonction de mise à jour
    participant AZ en tant qu'API Azure
    participant DB comme Datahub DB
    participant NQ comme Notify Queue
    participant NF comme fonction de notification
    participant EQ comme file d'attente d'emails
    participant EF comme expéditeur d'e-mails
    acteur U comme utilisateur du projet

      SF ->> SF : CRON Schedule
      SF ->> UQ : Message de mise à jour des files d'attente
      UQ ->> UF : Déclenche la fonction de mise à jour.
      UF ->> AZ : Demande de statistiques sur l'utilisation du crédit
      AZ ->> UF : Renvoie des statistiques ou un code de réessai.
      UF ->> DB : Mise à jour des statistiques d'utilisation de l'espace de travail
      UF ->> NQ : Message de vérification de la notification des files d'attente
      NQ ->> NF : Déclenche un message de contrôle de notification
      NF ->> DB : Lecture de l'utilisation du crédit de l'espace de travail
      NF ->> EQ : Mise en file d'attente de l'email de notification avec le % d'utilisation
      EQ ->> EF : Déclenche la fonction d'expéditeur de courriel
      EF ->> U : envoie un e-mail à l'utilisateur
```
## Configuration de la fonction

### Liens de la file d'attente

Toutes les fonctions seront liées aux files d'attente respectives via la ConnectionString nommée __StorageConnectionString__.

Le nom de la file d'attente n'est pas codé en dur dans l'implémentation de la fonction, le nom est stocké en utilisant une VARIABLE ENV. Par exemple :

```

    [Function("EmailNotificationHandler")]
    public async Task Run([QueueTrigger("%QueueEmailNotification%", Connection = "DatahubStorageConnectionString")] string requestMessage)
    {
      ...
    }
```


**Notification par courriel**

Nom de la file d'attente : __%QueueueEmailNotification%__

**ProjetUsageUpdater**

Nom de la file d'attente : __%QueueueProjectUsageUpdate%__

(Suite à venir...)


