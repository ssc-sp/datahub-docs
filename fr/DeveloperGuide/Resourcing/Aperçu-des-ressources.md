[_metadata_: remarks]:- "Automatically translated with DeepL. From: /DeveloperGuide/Resourcing/Resourcing-Overview.md"

[_(draft documentation, please review)_](/DeveloperGuide/Resourcing/Resourcing-Overview.md)

## Aperçu

Voici un aperçu rapide du flux logique pour créer de nouvelles ressources d'infrastructure avec l'infrastructure en nuage de Datahub.

## Espace de travail / Projet

Un espace de travail se compose entièrement de

- un dossier dans le référentiel de l'infrastructure privée avec les éléments suivants :
  - son propre état de terraformation à distance, indépendant de tout autre espace de travail
  - un module terraform pour les besoins de l'espace de travail de base
  - plusieurs modules de terraformation pour les ressources de l'espace de travail
- entrées multiples pour les utilisateurs dans la table `Project_Users`.
  - y compris le rôle `isAdmin` pour l'espace de travail
- une entrée dans la table `Datahub_Projects`.
- des entrées multiples dans la table `Project_Resources` qui contient la sortie des modules de ressources provisionnés à partir du dépôt de modules public.

## Contexte architectural

Ce processus comporte six composantes principales :

1. Utilisateurs
1. Portail Datahub
1. Files d'attente de messages
1. Responsable des ressources
1. Dépôts Git (Infrastructure & Modules)
1. Pipelines

Ces composants ont une complexité minimale et des limites de responsabilité concises. Ils communiquent entre eux pour approvisionner et gérer l'infrastructure de chaque espace de travail.

> Pour plus d'informations sur les communications entre les services, voir les [Composants de service] (Resourcing-Service-Components.md).

## Terraform Structures

L'infrastructure en nuage est approvisionnée à l'aide de Terraform. Le Terraform de chaque espace de travail est stocké dans son propre répertoire et exécuté indépendamment des autres espaces de travail afin de limiter le rayon d'action des changements de ressources.

L'infrastructure privée de l'espace de travail consomme les modèles et les modules du référentiel de l'infrastructure publique. Les modèles sont utilisés pour générer des modules maintenus de référencement terraform qui déploient les fonctionnalités de l'espace de travail.

> Pour plus d'informations sur la structure Terraform, voir la page [Structures Terraform](Resourcing-Terraform-Structures).

## Cours de ressources

L'exécution d'une ressource est le processus d'approvisionnement d'une nouvelle ressource ou de mise à jour d'une ressource existante. L'exécution des ressources est déclenchée par les actions des utilisateurs dans le portail pour créer ou mettre à jour une ressource. L'exécution des ressources est exécutée par le gestionnaire de ressource.

La messagerie entre le portail et les services d'infrastructure est gérée par les files d'attente de messages.

> Pour plus d'informations sur les cycles de ressources, voir la page [cycles de ressources] (Resourcing-Resource-Runs.md).
