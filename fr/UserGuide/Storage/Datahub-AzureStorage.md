[_metadata_: remarks]:- "Automatically translated with DeepL. From: /UserGuide/Storage/Datahub-AzureStorage.md"

[_(draft documentation, please review)_](/UserGuide/Storage/Datahub-AzureStorage.md)

# Travailler avec Azure Storage

## Qu'est-ce qu'Azure Storage

Azure storage fournit un stockage en nuage évolutif et sécurisé pour l'archivage, les données, les applications et les charges de travail.

Il existe deux grands types de comptes de stockage :

- **Azure Data Lake Storage (Gen2)** - conçu pour l'analyse des données volumineuses, il fournit des listes de contrôle d'accès au niveau des fichiers et des dossiers.
- **Azure Blob Storage** - compte de stockage de base - ne fournit pas de contrôle d'accès au niveau des fichiers et des dossiers mais est requis pour la compatibilité dans certains scénarios.

## Comment copier des fichiers sur Azure

**Datahub Storage Explorer** est la méthode préférée pour travailler avec les comptes Azure Storage. L'explorateur de stockage offre une interface de type glisser-déposer et est accessible depuis la page Projet de données. L'outil permet aux utilisateurs de charger et de télécharger des fichiers.

## Téléchargement automatisé et fichiers volumineux

AzCopy est l'option recommandée pour travailler avec des fichiers volumineux et l'outil peut également être intégré dans des scripts. L'outil est disponible pour Windows et Linux. Voir [AzCopy pour copier des fichiers depuis/vers Azure Storage] (Use-AzCopy-to-Interact-with-Azure-Storage-Account) pour plus de détails.
