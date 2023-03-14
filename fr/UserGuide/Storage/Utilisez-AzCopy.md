---
remarks: Automatically translated with DeepL
source: /UserGuide/Storage/Use-AzCopy.md
draft: true
---

# Utiliser AzCopy pour interagir avec le compte de stockage Azure

## Hypothèses
- Familiarité avec la ligne de commande (par exemple, PowerShell, Linux Shell scripting).
- Pour l'interaction en ligne de commande uniquement. Les utilisateurs peuvent choisir d'utiliser Azure Storage Explorer et DataHub Portal Storage Explorer comme alternatives s'ils n'utilisent pas la ligne de commande.

## Conditions préalables
- Téléchargez AzCopy à partir de [Azure] (https://aka.ms/downloadazcopy-v10-windows) (aucune installation n'est requise).
- Générer le jeton SAS dans Azure ou dans DataHub Portal. Remarque : si nécessaire, vous pouvez demander un jeton SAS pour une période prolongée - envoyez votre demande en utilisant le [Formulaire de demande de support FSDH] (https://forms.office.com/r/zk82ehvUtv).

## Synchronisation initiale du dossier depuis le local
- Dans la ligne ci-dessous, remplacez "C:\mydata\stage" par votre répertoire local où se trouvent les données.
- Exécutez AzCopy pour synchroniser les données du PC local ou du lecteur réseau vers Azure : "Azcopy sync C:\mydata\stage "<sas_uri>"``.

## Folder Sync Suppression des fichiers manquants dans Azure
- Dans la ligne ci-dessous, remplacez "C:\mydata\stage" par votre répertoire local où se trouvent les données.
- Ajouter l'option *--delete-destination* pour supprimer les fichiers s'ils ont été supprimés dans la source. ``azcopy sync C:\mydata\stage "<sas_uri>" --delete-destination``

## Télécharger
- Dans la ligne ci-dessous, remplacez "C:\mydata\stage" par votre répertoire local où les données seront téléchargées.
- Télécharger tous les fichiers d'Azure en local (les coûts s'appliquent) ```azcopy cp "<sas_uri>" C:\NMydata\stage --recursive ```
