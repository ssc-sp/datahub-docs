---
remarks: Automatically translated with DeepL
source: /UserGuide/README.md
draft: true
---

# Aperçu de la plateforme FSDH - Haut niveau

## Espaces de travail

L'espace de travail FSDH permet à plusieurs équipes, laboratoires ou utilisateurs d'accéder facilement aux outils de stockage et d'analyse :

- Comptes de stockage : un espace de travail comprend un explorateur de stockage permettant de charger/télécharger des fichiers avec une interface conviviale. AzCopy est utilisé comme interface en ligne de commande pour télécharger de très grands ensembles de données.
- Intégration de Databricks : l'espace de travail a un lien direct avec les espaces de travail de Databricks et simplifie également le montage du compte de stockage pour les carnets.
- CONFIRMEZ QUE C'EST CORRECT Partage de données : Un simple flux de travail permet aux utilisateurs de sélectionner un fichier et de demander le partage des données (voir Partage des données pour plus de détails).
- Embarquement des utilisateurs : Les administrateurs de projets peuvent inviter d'autres utilisateurs à leur(s) espace(s) de travail.

### Gestion des utilisateurs

Le portail FSDH s'intègre à Azure Active Directory et gère les rôles et les utilisateurs. Le portail dispose de 2 types d'utilisateurs :
- Les utilisateurs peuvent accéder aux ressources de l'espace de travail
- Les responsables de l'espace de travail (Admin) peuvent inviter d'autres utilisateurs et attribuer des rôles.

### Gestion des ressources

Le portail FSDH est conçu pour être utilisé avec Terraform ou d'autres systèmes IaC et automatiser la création de ressources. Le système gère une liste de flux de travail avec les demandes des utilisateurs dans des tableaux SQL qui peuvent être intégrés dans des pipelines DevOps.

### Sécurisé par défaut

Chaque composant du système a été conçu dans un souci de haute sécurité. Le portail FSDH ne nécessite aucun rôle Azure ou principal de service élevé et utilise des autorisations OBO pour toutes les tâches de gestion.

### Aide intégrée

Les pages et modules clés du portail FSDH offrent une aide intégrée pour guider les utilisateurs avec Azure Storage et Databricks. Le contenu actuel de l'aide se trouve dans le Wiki github.

### Cadre de saisie des données

Le portail FSDH comprend un cadre de saisie de données qui s'appuie sur Entity Framework, un code fluide, des annotations et peut générer des formulaires complexes pour prendre en charge les règles commerciales des clients, des tables multiples par le biais de tables SQL standard. Ce modèle permet une intégration facile dans Power BI ou Tableau.

## Technologie

Le portail Web de la FSDH est développé en .NET 7 et utilise Blazor et ASP.Net core ainsi que plusieurs autres bibliothèques open source. Le portail FSDH peut fonctionner sous Windows, Linux et peut être déployé dans n'importe quel environnement en nuage. Le style s'appuie sur SCSS pour modulariser les paramètres CSS.

## Extensibilité et configuration

Plusieurs personnalisations peuvent être effectuées en utilisant simplement la configuration. Chaque module du projet de données peut être activé ou désactivé dans la configuration.

Le FSDH est divisé en modules qui se connectent entre eux à l'aide du broker IoC d'ASP.Net core. Cela permet d'ajouter des extensions par le biais de paquets nuget ou de projets séparés. Tous les modules sont automatiquement connectés au portail en utilisant le balayage d'assemblage. Chaque module peut être désactivé à l'aide des fichiers de configuration.
