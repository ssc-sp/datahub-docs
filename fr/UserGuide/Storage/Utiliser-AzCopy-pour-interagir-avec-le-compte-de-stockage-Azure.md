[_metadata_: remarks]:- "Automatically translated with DeepL. From: /UserGuide/Storage/Use-AzCopy-to-Interact-with-Azure-Storage-Account.md"

[_(draft documentation, please review)_](/UserGuide/Storage/Use-AzCopy-to-Interact-with-Azure-Storage-Account.md)

# Utiliser AzCopy pour interagir avec le compte de stockage Azure

## Hypothèses
- Familiarité avec la ligne de commande (par exemple, PowerShell, Linux Shell scripting).
- Pour l'interaction en ligne de commande uniquement. Les utilisateurs peuvent choisir d'utiliser Azure Storage Explorer et DataHub Portal Storage Explorer comme alternatives s'ils n'utilisent pas la ligne de commande.

## Conditions préalables
- Téléchargez AzCopy à partir de [Azure] (https://aka.ms/downloadazcopy-v10-windows) (aucune installation n'est requise).
- Générer le jeton SAS dans Azure ou dans DataHub Portal

## Synchronisation initiale du dossier depuis le local
- Dans la ligne ci-dessous, remplacez "C:\mydata\stage" par votre répertoire local où se trouvent les données.
- Exécutez AzCopy pour synchroniser les données du PC local ou du lecteur réseau vers Azure : "Azcopy sync C:\mydata\stage "<sas_uri>"``.

## Folder Sync Suppression des fichiers manquants dans Azure
- Dans la ligne ci-dessous, remplacez "C:\mydata\stage" par votre répertoire local où se trouvent les données.
- Ajouter l'option *--delete-destination* pour supprimer les fichiers s'ils ont été supprimés dans la source. ``azcopy sync C:\mydata\stage "<sas_uri>" --delete-destination``

## Télécharger
- Dans la ligne ci-dessous, remplacez "C:\mydata\stage" par votre répertoire local où les données seront téléchargées.
- Télécharger tous les fichiers d'Azure vers le local (des coûts s'appliquent) ``azcopy cp "<sas_uri>" C:\mydata\stage``