---
remarks: Automatically translated with DeepL
source: /DeveloperGuide/Achievements-Profiles/readme.md
draft: true
---

# Réalisations de l'utilisateur et personnalisation du profil

# Vue d'ensemble

Ce document décrit la conception de la fonction de personnalisation des réalisations et du profil de l'utilisateur.

# Réalisations des utilisateurs

## Types de réalisations

Les réalisations sont divisées en deux types :

- **Réalisation** : Les réalisations qui sont attribuées lorsqu'un utilisateur accomplit une tâche.
- **Trophée** : Les réalisations qui sont attribuées après qu'un utilisateur a accompli une série de réalisations.

## Niveaux du profil de l'utilisateur

Le niveau du profil de l'utilisateur est calculé sur la base du score total de toutes les réalisations de l'utilisateur. Le niveau est calculé selon la formule suivante :

``csharp
# Ceci a été généré, il peut être nécessaire de le modifier manuellement.
int level = (int)Math.Floor(Math.Log(score, 2)) ;
```

## Réalisations à débloquer

Les réalisations peuvent être débloquées par l'utilisateur et peuvent être utilisées pour personnaliser le profil de l'utilisateur. Les réalisations à débloquer sont divisées en deux types :

- Images d'arrière-plan** : Images d'arrière-plan qui peuvent être utilisées pour personnaliser le profil de l'utilisateur.
- Images de profil** : Images de profil qui peuvent être utilisées pour personnaliser le profil de l'utilisateur.
- **Trophées** : Trophées qui peuvent être affichés sur le profil de l'utilisateur.

## Modèle de données

Le diagramme suivant montre le modèle de données pour la fonctionnalité Réalisations de l'utilisateur :

``mermaid``

classDiagram

    class PortalUser {
        +int Id

        +guid GraphId
        +Chaîne de caractères DisplayName
        +Chaîne de caractères Email

        +DateTime FirstLoginDateTime
        +DateTime LastLoginDateTime

        +string ? BannerPictureUrl
        +string ? ProfilePictureUrl
        +bool HideAchievements
        +string ? Langue
    }

    class TelemetryEvent {
        +int Id
        +int UserId
        +Chaîne de caractères EventName
        +DateTime EventDate
    }

    class Achievement {
        <<seedable>>
        +id Id

        +Chaîne de caractères Nom
        +Chaîne de caractères Description
        +int Points = 1
        +Chaîne de caractères ConcatenatedRules

        +string ImageUrl(string storagePath)
        +string ? UnlockableUrl(string storagePath)
        +string[] Rules()
        +bool IsTrophy()
    }

    class UserAchievement {
        +int UserId
        +int AchievementId
        +DateTime UnlockedAt
    }


    Réalisation de l'utilisateur --> Réalisation
    UserAchievement --> PortalUser
    TelemetryEvent --> PortalUser

```
