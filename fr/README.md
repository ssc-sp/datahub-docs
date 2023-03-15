---
remarks: Automatically translated with DeepL
source: /README.md
draft: true
---
## Bienvenue

> DataHub est un portail et un backend qui prend en charge l'analyse et le stockage en nuage.

## Provisionneur de ressources Terraform

Le portail permet aux utilisateurs de demander des ressources qui sont déployées par des modules terraform dans des pipelines devops. Les ressources de l'espace de travail sont gérées par des modules terraform qui sont poussés vers des dépôts git et déployés à partir de pipelines devops.
- x] DataHub suit les processus devops standard.
- x] Les modifications apportées à l'infrastructure passent par des demandes de tirage et des révisions.
- x] Le référentiel des modules terraform standard peut être facilement étendu grâce aux modules Terraform.
- x] Les modules Storage, Databricks et Virtual Machines sont disponibles.
- x] Les autorisations des utilisateurs peuvent être synchronisées entre les ressources et les espaces de travail.

## Catalogue de données open source

Les espaces de travail, les fichiers, les rapports, les espaces de travail et les bases de données peuvent être ajoutés au catalogue de données intégré.
- x] Le catalogue est basé sur la norme Dublin Core.
- x] Les normes de données ouvertes open.canada.ca sont intégrées.
- x] Le modèle de métadonnées hiérarchiques peut rationaliser le balisage des artefacts de l'espace de travail.

## Storage Explorer

L'espace de travail fournit une interface permettant de télécharger facilement des données vers un compte de stockage en nuage.
- x] Explorateur de stockage moderne avec téléchargement de fichiers et de répertoires
- x] Générateur de jetons pour l'intégration avec des outils externes
- x] Outil de bureau expérimental basé sur electron pour les téléchargements de données volumineux

## Analyse intégrée avec Power BI

Les espaces de travail Power BI peuvent être liés aux espaces de travail DataHub.
- x] Gouvernance facile des tableaux de bord grâce aux espaces de travail de production et de développement.
- x] Catalogage des tableaux de bord et des ensembles de données
- x] Les tableaux de bord anglais et français peuvent être reliés en une seule entité.

## Cadre de saisie des données et flux de travail

Des modules peuvent être développés et tirer parti des composants existants
- x] Génération de formulaires à partir d'entités DotNet Entity Framework
- x] Les modules peuvent être liés à des espaces de travail

## Système de documentation intégré

La documentation basée sur Docsify est intégrée au portail.
- x] Le module de traduction peut exploiter les services de traduction en ligne pour générer des brouillons.
- x] Le format Markdown est rendu à l'intérieur du portail afin de tirer parti des composants Web existants.


## Modulaire et ouvert

Le portail DataHub est modulaire et son déploiement peut être personnalisé
- x] Exploite les composants web modernes pour améliorer l'accessibilité et la mise en page adaptative.
- x] Les fonctions peuvent être désactivées
- x] Le contenu peut être personnalisé à l'aide de profils
- x] Options de configuration étendues


