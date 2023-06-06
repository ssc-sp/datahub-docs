---
remarks: Automatically translated with DeepL
source: /UserGuide/Storage/Use-AzCopy.md
draft: true
---

# Utiliser AzCopy pour interagir avec le compte de stockage Azure

## Commandes utiles

Voici quelques exemples de lignes pour interagir avec un espace de travail. Dans ces exemples de lignes, remplacez `C:\data\stage` par le chemin du dossier ou du fichier qui vous intéresse. Pour un guide complet sur l'utilisation d'AzCopy, voir ci-dessous.

Copie d'un fichier local vers Azure (téléchargement d'un fichier ou d'un dossier) :

```
azcopy copy C:\mydata\stage "<sas_uri>"
```

Copier d'Azure vers local (télécharger un fichier ou un dossier) :

```
azcopy copy "<sas_uri>" C:\NMydata\stage
```

Synchronisation récursive du local vers Azure (mise en miroir d'un dossier de votre système vers Azure) :

```
azcopy sync C:\mydata\stage "<sas_uri>" --recursive
```

Synchronisation récursive d'Azure vers local (mise en miroir d'un dossier d'Azure vers votre système) :

```
azcopy sync "<sas_uri>" C:\NMydata\stage --recursive
```

## Drapeaux utiles

Vous pouvez ajouter des drapeaux à la fin d'une commande pour changer le comportement d'AzCopy. En voici quelques uns utiles :

- `--recursive` : copier ou synchroniser tous les fichiers et dossiers du dossier source. Sans ce drapeau, seuls les fichiers et dossiers à la racine du dossier source seront copiés ou synchronisés.
- `--delete-destination` : supprime les fichiers dans le dossier de destination s'ils ont été supprimés dans le dossier source. Cette option n'est disponible que pour la commande `sync`.
- `--overwrite=ifSourceNewer` : écrase les fichiers dans le dossier de destination s'ils sont plus anciens que les fichiers sources. Cette option n'est disponible que pour la commande `sync`.

Pour plus d'informations sur les drapeaux qui peuvent être utilisés sur n'importe quelle commande, lancez `azcopy <commande> --help`.

# Guide AzCopy

<video width="720" height="405" controls>
    <source src="/api/media/azcopy.mp4" type="video/mp4">
    Votre navigateur ne prend pas en charge la balise vidéo.
</video>

## Pré-requis

- Familiarité avec la ligne de commande (par exemple, PowerShell, Linux Shell scripting).
- Pour l'interaction en ligne de commande uniquement. Les utilisateurs peuvent choisir d'utiliser Azure Storage Explorer et DataHub Portal Storage Explorer comme alternatives s'ils n'utilisent pas la ligne de commande.

## Installation

Pour utiliser AzCopy, vous devez l'installer sur votre système. Vous pouvez télécharger la dernière version d'AzCopy [ici] (https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10#download-azcopy). Pour les machines Windows, un fichier zip sera téléchargé. Extrayez le contenu du fichier zip dans un dossier de votre choix. Pour les machines Linux, un fichier tar sera téléchargé. Consultez la documentation de votre distribution Linux pour savoir comment extraire le contenu du fichier tar.

## Utilisation d'AzCopy

Sous Windows, le processus d'installation vous laissera avec un fichier exécutable. Afin d'utiliser AzCopy, vous devez ouvrir une invite de commande et naviguer dans le dossier où se trouve l'exécutable. Vous pouvez alors exécuter les commandes d'AzCopy en tant que telles :

```
azcopy <commande> <arguments> <--flags>
```

Voici quelques-unes des commandes les plus utiles :

- **Copie**

  ```
  azcopy copy <source> <destination> <--flags>
  ```

  Cette commande copiera le fichier/dossier source vers la destination. Lors de la copie d'un dossier, pour s'assurer qu'une copie profonde est effectuée, utilisez l'option `--recursive`.

- **Sync**
  ```
  azcopy sync <source> <destination> <--flags>
  ```
  Cette commande va créer un miroir du fichier ou du dossier source vers le fichier ou le dossier de destination. Pour faire une copie profonde de votre source, utilisez l'option `--recursive`.
- **Supprimer**
  ```
  azcopy remove <source> <--flags>
  ```
  Cette commande supprimera le fichier ou le dossier source. Pour supprimer un dossier, utilisez l'option `--recursive`.
- **Liste**
  ```
  azcopy list <source> <--flags>
  ```
  Cette commande listera les fichiers et les dossiers dans le dossier source. Pour lister les fichiers et dossiers d'un dossier, utilisez l'option `--recursive`.

Lorsque vous utilisez ces commandes, le jeton SAS généré pointera vers la racine de votre espace de travail et ressemblera à ceci :

```
"https://fsdhprojdw1poc.blob.core.windows.net/datahub?token-info"
```

Pour pointer vers un dossier ou un fichier spécifique, vous pouvez ajouter le chemin vers ce fichier/dossier après `datahub`, comme suit :

```
"https://fsdhprojdw1poc.blob.core.windows.net/datahub/path/to/folder?token-info"
```

**Exemples:**

Copier le fichier `sample.csv` sur ma machine dans la racine de mon espace de travail :

```
azcopy copy C:\Nmydata\Nsample.csv "<sas_uri>"
```

Copier un dossier `sample` sur ma machine dans la racine de mon espace de travail :

```
azcopy copy C:\Nmydata\Nsample "<sas_uri>" --recursive
```

Synchronisation du dossier `sample` de ma machine dans un dossier spécifique de mon espace de travail :

```
azcopy sync C:\mydata\sample "blob-name.blob.core.windows.net/datahub/path/to/folder?token-info" --recursive
```

## En savoir plus

Vous pouvez en savoir plus sur AzCopy, y compris des exemples de scénarios impliquant le stockage Azure mais aussi les buckets Amazon S3 ou le stockage dans le nuage de Google, dans la [documentation officielle] (https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10).
