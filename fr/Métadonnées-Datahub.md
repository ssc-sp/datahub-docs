[_metadata_: remarks]:- "Automatically translated with DeepL. From: /Datahub-Metadata.md"

[_(draft documentation, please review)_](/Datahub-Metadata.md)

# Métadonnées

Les **métadonnées** sont utilisées pour décrire les objets liés à Datahub. Ce document explique le modèle utilisé pour représenter les définitions des métadonnées et les valeurs associées à un objet dans le système. Les métadonnées peuvent décrire tout objet qui est identifié par un identifiant unique. Il est recommandé d'utiliser des GUIDs comme identifiants pour les objets afin d'éviter les conflits.

## Entités du modèle de données

![](https://github.com/NRCan/datahub-portal/blob/develop/Datahub.Metadata/Metadata_definition.png)

### MetadataVersions

Une version de métadonnées décrit une version et un nom de schéma pour un ensemble spécifique de définitions de champs. La table devrait être renommée en schéma à l'avenir. Le champ _Source_TXT_ représente le nom du schéma (ou de la source) d'un ensemble de définitions.

### FieldDefinitions

La table Field Definitions stocke la définition de tous les champs pour un ensemble de champs (schéma/source). Tous les champs ont des noms et des descriptions localisés.

### Choix de champs

Certaines définitions de champ peuvent avoir une liste de choix prédéterminée. Le FieldChoice stocke le nom et la localisation de chaque choix d'une définition de champ.

### ObjectMetadata

Enregistrement maître pour une métadonnée d'objet, il représente un objet externe dans le stockage de métadonnées de Datahub.

### ObjectFieldValues

Stocke toutes les valeurs des champs décrivant les métadonnées d'un objet.

## Comment introduire un ensemble de métadonnées ?

* Créer un nouvel enregistrement dans la table **MetadataVersions**.
* Créer l'ensemble des **FieldDefinitions** et des **FieldChoices** correspondants.
