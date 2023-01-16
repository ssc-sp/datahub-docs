[_metadata_: remarks]:- "Automatically translated with DeepL. From: /DeveloperGuide/Resourcing/Resourcing-Servicing-Components.md"

[_(draft documentation, please review)_](/DeveloperGuide/Resourcing/Resourcing-Servicing-Components.md)

## Utilisateurs

Les utilisateurs interagissent avec le portail Datahub pour demander une nouvelle infrastructure et gérer les espaces de travail. Ils sont répartis dans les catégories suivantes

- Utilisateurs de Datahub
  - Éditeurs de projets
  - Administrateurs de projets
  - Contributeurs au projet
- Administrateurs de Datahub

## Portail Datahub

Le portail est la principale interface permettant aux utilisateurs d'interagir avec le Datahub. Il s'agit d'une application web qui permet aux utilisateurs de créer de nouvelles infrastructures, de gérer les infrastructures existantes et de consulter le statut de leurs demandes.

## Files d'attente de messages

Le Datahub utilise des files de messages pour communiquer entre le portail et l'infrastructure.

- Le portail place des demandes dans les files d'attente pour provisionner de nouvelles infrastructures et les retire des files d'attente pour mettre à jour l'état des infrastructures.

- Les services d'infrastructure tirent des messages de la file d'attente pour créer une nouvelle infrastructure et poussent des messages pour mettre à jour l'état de l'infrastructure.

## Directeur des ressources

Le gestionnaire de ressources est un service qui gère les demandes d'infrastructure entrantes. Il est responsable de la création, de la mise à jour et de la suppression de l'infrastructure via terraform.

## Référentiels d'infrastructure

Il existe deux référentiels d'infrastructure qui sont utilisés pour gérer l'infrastructure.

1. Le référentiel d'infrastructure public est utilisé pour stocker les modèles et les modules qui sont utilisés pour fournir l'infrastructure. Les modèles sont utilisés pour générer des modules maintenus de référencement terraform qui déploient les fonctionnalités de l'espace de travail.

1. Le référentiel d'infrastructure privé est utilisé pour stocker la terraforme de chaque espace de travail. La terraforme est exécutée indépendamment des autres espaces de travail afin de limiter le rayon d'action des changements de ressources.

## Pipeline

Le pipeline est chargé d'exécuter le terraform pour provisionner l'infrastructure. Il est déclenché par le gestionnaire de ressources lorsqu'une nouvelle demande d'infrastructure est reçue ou lorsqu'une demande d'extraction est effectuée dans le référentiel d'infrastructure privé.
