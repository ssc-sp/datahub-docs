---
remarks: Translation reviewed by DataHub team
source: /UserGuide/Storage/Datahub-AzureStorage.md
draft: false
---

# Travailler avec Azure Storage

## Qu'est-ce qu'Azure Storage

Le DHSF utilise Azure Storage, la solution de stockage en nuage de Microsoft pour les scénarios modernes de stockage de données. Azure Storage offre un stockage hautement disponible, massivement évolutif, durable et sécurisé pour une variété d'objets de données dans le cloud.

Il existe deux grands types de comptes de stockage :

- **Azure Data Lake Storage (Gen2)** - conçu pour l'analyse des données volumineuses, il fournit des listes de contrôle d'accès au niveau des fichiers et des dossiers.
- **Azure Blob Storage** - compte de stockage de base - ne fournit pas de contrôle d'accès au niveau des fichiers et des dossiers mais est requis pour la compatibilité dans certains scénarios.

## Comment copier des fichiers sur Azure

Vous avez la possibilité d'utiliser l'interface du navigateur ou les options de l'interface de ligne de commande (ILC) pour charger/télécharger.

**Datahub Storage Explorer** est la méthode simple pour travailler avec les comptes Azure Storage. L'explorateur de stockage offre une interface de type glisser-déposer et est accessible à partir de la page Espace de travail. L'outil permet aux utilisateurs de charger et de télécharger des fichiers.

## Téléchargement automatisé et fichiers volumineux

AzCopy est l'option recommandée pour travailler avec des fichiers volumineux et l'outil peut également être intégré dans des scripts. L'outil est disponible pour Windows et Linux. 

