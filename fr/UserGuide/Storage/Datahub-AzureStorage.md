---
remarks: Automatically translated with DeepL
source: /UserGuide/Storage/Datahub-AzureStorage.md
draft: true
---

# Travailler avec Azure Storage

## Qu'est-ce qu'Azure Storage

Le Federal Science DataHub utilise Azure Storage, la solution de stockage en nuage de Microsoft pour les scénarios modernes de stockage de données. Azure Storage offre un stockage hautement disponible, massivement évolutif, durable et sécurisé pour une variété d'objets de données dans le cloud.

Il existe deux grands types de comptes de stockage :

- **Azure Data Lake Storage (Gen2)** - conçu pour l'analyse des données volumineuses, il fournit des listes de contrôle d'accès au niveau des fichiers et des dossiers.
- **Azure Blob Storage** - compte de stockage de base - ne fournit pas de contrôle d'accès au niveau des fichiers et des dossiers mais est requis pour la compatibilité dans certains scénarios.

## Comment copier des fichiers sur Azure

Vous avez la possibilité d'utiliser l'interface du navigateur ou les options de l'interface de ligne de commande (CLI) pour charger/télécharger.

**Datahub Storage Explorer** est la méthode simple pour travailler avec les comptes Azure Storage. L'explorateur de stockage offre une interface de type glisser-déposer et est accessible à partir de la page Espace de travail. L'outil permet aux utilisateurs de charger et de télécharger des fichiers.

## Téléchargement automatisé et fichiers volumineux

AzCopy est l'option recommandée pour travailler avec des fichiers volumineux et l'outil peut également être intégré dans des scripts. L'outil est disponible pour Windows et Linux. Voir [AzCopy pour copier des fichiers depuis/vers Azure Storage] (Use-AzCopy-to-Interact-with-Azure-Storage-Account) pour plus de détails.

## Tutoriel vidéo

Un [Tutoriel vidéo FSDH - focus AzCopy] (https://dhdemosand.blob.core.windows.net/datahub/Data%20Sharing%20Tutorial.mp4?sv=2020-10-02&st=2022-02-09T20%3A22%3A12Z&se=2023-02-10T20%3A22%3A00Z&sr=b&sp=r&sig=OeNPrxbhVMshileL39VKre%2FQBBYfUae5gz1M%2Fsyo3JY%3D) a été créé pour guider les utilisateurs à travers les étapes du téléchargement de fichiers à l'aide de **AzCopy**.
