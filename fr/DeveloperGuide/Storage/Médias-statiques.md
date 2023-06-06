---
remarks: Automatically translated with DeepL
source: /DeveloperGuide/Storage/Static_Media.md
draft: true
---

# Vue d'ensemble des médias statiques

## Médias statiques

Les médias statiques sont une collection de fichiers qui sont servis directement au client sans aucun traitement par le serveur.  Il s'agit généralement d'images, de vidéos ou d'autres fichiers qui ne sont pas modifiés par le serveur.  Le serveur envoie simplement le fichier au client lorsqu'il le demande.


## Stockage des médias statiques

Les médias statiques sont stockés dans un conteneur de stockage Azure `fsdhstaticassetstorage` dans le groupe de ressources `fsdh-static-assets`. Il existe deux conteneurs : `achievements` et `media`.

Le conteneur `achievements` contient les images des réalisations et est accessible au public.

Le conteneur `media` contient les images de la page média et nécessite un jeton SAS pour y accéder.  Le jeton SAS est généré par le serveur lors d'une redirection à travers le `MediaController` qui est accessible au point de terminaison `/api/media/<filepath>`.

## Chargement de médias statiques

Pour l'instant, tous les contenus statiques doivent être téléchargés manuellement sur le portail.

## Configuration des médias statiques

Les médias sont configurés par l'objet `DatahubPortalConfiguration`. Vous pouvez les surcharger avec le fichier `appsettings.json`.

```json
// appsettings.json
{
    ..
    "Media" : {
        "StorageConnectionString" : "<chaîne de connexion au compte de stockage>",
        "StaticAssetsUrl" : "<url to the static assets>",
    }
    ..
}
