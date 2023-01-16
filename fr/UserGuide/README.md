[_metadata_: remarks]:- "Automatically translated with DeepL. From: /UserGuide/README.md"

[_(draft documentation, please review)_](/UserGuide/README.md)

# Guide de l'utilisateur de DataHub

## Quelles sont les fonctionnalités du portail ?

### Landing & Shortcuts

Les pages d'atterrissage DataHub fournissent des listes de raccourcis instantanés pour permettre aux utilisateurs d'accéder à leurs outils récents, ainsi qu'aux zones de stockage, Power BI et Databricks associées à leur compte. La page d'accueil DataHub a évité à de nombreux utilisateurs d'épuiser la navigation dans les menus Power BI et Databricks.

### Projets de données

Le DataHub permet à plusieurs équipes, laboratoires ou utilisateurs d'accéder facilement au stockage, aux bases de données, à la science des données et aux outils analytiques :

- Comptes de stockage : Un projet de données comprend un explorateur de stockage permettant de charger/télécharger des fichiers avec une interface utilisateur conviviale.
- Intégration de Databricks : Le projet de données a un lien direct avec les espaces de travail Databricks et simplifie également le montage du compte de stockage pour les ordinateurs portables.
- Intégration de Power BI : L'intégration met en œuvre le modèle de gouvernance de RNCan et connecte les utilisateurs directement à leurs espaces de travail et aux rapports clés.
- Serveur SQL : Un serveur SQL peut être associé à un projet et les détails de la connexion seront directement disponibles pour les utilisateurs.
- PostgreSQL : Les serveurs Postgresql peuvent également être liés et les outils du projet peuvent générer le jeton Azure associé pour une authentification intégrée.
- Partage de données : Un simple flux de travail permet aux utilisateurs de sélectionner un fichier et de demander le partage des données (voir Partage des données pour plus de détails).
- Embarquement des utilisateurs : Les administrateurs de projet peuvent inviter d'autres utilisateurs à leur(s) projet(s).

### Gestion des utilisateurs

Le portail s'intègre à Azure Active Directory et gère les rôles et les utilisateurs. Le portail dispose de 3 types d'utilisateurs : Les administrateurs de datahub, les administrateurs de projet et les utilisateurs. Les utilisateurs peuvent accéder aux ressources du projet, les administrateurs de projet peuvent inviter d'autres utilisateurs et les administrateurs de datahub ont la possibilité d'inviter des administrateurs.

### Gestion des ressources

Le portail est conçu pour être utilisé avec Terraform ou d'autres systèmes IaC et automatiser la création de ressources. Le système gère une liste de flux de travail avec les demandes des utilisateurs dans des tableaux SQL qui peuvent être intégrés dans des pipelines DevOps.

### Sécurisé par défaut

Chaque composant du système a été conçu dans un souci de haute sécurité. Le portail ne nécessite aucun rôle Azure ou principal de service élevé et utilise des autorisations OBO pour toutes les tâches de gestion.

### Aide intégrée

Les pages et modules clés du portail offrent une aide intégrée pour guider les utilisateurs avec Power BI, Databricks et Azure Storage. Le contenu actuel de l'aide se trouve dans le Wiki.

### Cadre de saisie des données

Le portail comprend un cadre de saisie des données qui s'appuie sur Entity Framework, un code fluide, des annotations et peut générer des formulaires complexes pour prendre en charge les règles commerciales des clients, des tables multiples par le biais de tables SQL standard. Ce modèle permet une intégration facile dans Power BI ou Tableau.

## Technologie

Le portail Web est développé en .NET 6 et utilise Blazor et ASP.Net core ainsi que plusieurs autres bibliothèques open source. Le portail peut fonctionner sous Windows, Linux et peut être déployé dans n'importe quel environnement en nuage. Le style s'appuie sur SCSS pour modulariser les paramètres CSS.

## Extensibilité et configuration

Plusieurs personnalisations peuvent être effectuées en utilisant simplement la configuration. Chaque module du projet de données peut être activé ou désactivé dans la configuration.

Le DataHub est divisé en modules qui se connectent entre eux à l'aide du broker IoC d'ASP.Net core. Cela permet d'ajouter des extensions par le biais de paquets nuget ou de projets séparés. Tous les modules sont automatiquement reliés au portail à l'aide d'un balayage d'assemblage. Chaque module peut être désactivé à l'aide des fichiers de configuration.
