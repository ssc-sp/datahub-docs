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

Les réalisations sont divisées en trois types :

- **Une fois** : Les réalisations qui ne sont attribuées qu'une fois et ne le sont plus jamais.
- **Répétition** : Réalisations qui sont récompensées plusieurs fois.
- **Comptable** : Les réalisations qui sont récompensées sur la base d'un décompte ou d'une collection.

## Niveaux du profil de l'utilisateur

Le niveau du profil de l'utilisateur est calculé sur la base du score total de toutes les réalisations de l'utilisateur. Le niveau est calculé selon la formule suivante :

``csharp
int level = (int)Math.Floor(Math.Log(score, 2)) ;
```

Le score est calculé en fonction du type de réalisation :

- Une seule fois** : Le score est généralement de 1, mais il peut être de n'importe quelle valeur.
- **Répétitible** : Le score est généralement de 1, mais il peut être de n'importe quelle valeur.
- **Comptable** : Le score est généralement le nombre d'éléments de la collection, mais il peut s'agir de n'importe quelle valeur.

## Réalisations à débloquer

Les réalisations peuvent être débloquées par l'utilisateur et peuvent être utilisées pour personnaliser le profil de l'utilisateur. Les réalisations à débloquer sont divisées en deux types :

- Images d'arrière-plan** : Images d'arrière-plan qui peuvent être utilisées pour personnaliser le profil de l'utilisateur.
- Images de profil** : Images de profil qui peuvent être utilisées pour personnaliser le profil de l'utilisateur.

## Modèle de données

Le diagramme suivant montre le modèle de données pour la fonctionnalité Réalisations de l'utilisateur :

``mermaid``
classDiagram
    class User {
        +guid Id
        +Chaîne de caractères Nom
        +Chaîne de caractères Email
    }

    class Achievement {
        +int Id
        +Chaîne de caractères Nom
        +Chaîne de caractères Description
        + points d'indice
        +Chaîne de caractères ImageUrl
        +Type de réalisation Type
        +chaîne[] RuleExpressions
        +Déverrouillable ? Déverrouillable
    }

    class Unlockable {
        +int Id
        +Chaîne de caractères Nom
        +UnlockableType Type
        +Chaîne de caractères ImageUrl
    }

    class UserAchievement {
        +int UserId
        +int AchievementId
        +Utilisateur Utilisateur
        +int Score
        +Réalisations Réalisations
    }

    class UserUnlockable {
        +int UserId
        +int UnlockableId
        +DateTime UnlockedAt
        +Utilisateur Utilisateur
        +Unlockable Unlockable
    }

    class AchievementType {
        <<énumération>>
        Temps unique
        Répétable
        Comptable
    }

    class UnlockableType {
        <<énumération>>
        Image de fond
        ProfilImage
        Badge
    }

    Réalisation de l'utilisateur --> Utilisateur
    Réalisation de l'utilisateur --> Réalisation
    Réalisation --> Déverrouillable
    UserUnlockable --> Utilisateur
    UserUnlockable --> Déverrouillable
```
