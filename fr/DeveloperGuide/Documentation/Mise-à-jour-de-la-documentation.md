---
remarks: Automatically translated with DeepL
source: /DeveloperGuide/Documentation/Update-documentation.md
draft: true
---

# Mise à jour de la documentation

Ce document couvre le processus de mise à jour de la documentation dans DHSF DataHub.

## Plus de pages

Si vous avez besoin de plus de pages, vous pouvez simplement créer plus de fichiers markdown dans le répertoire datahub-docs.

La structure du répertoire contient les principaux guides de documentation :
- Guide du développeur:** Couvre la solution DataHub .net et terraform
- Guide de l'utilisateur:** Contient les fichiers visibles dans la rubrique "Ressources" du portail.
- **AdminGuide:** Ce guide est destiné à l'équipe DHSF et fournit de la documentation pour les tâches courantes.

## Docsify Style

DataHub suit la même structure que Docsify. La documentation est rendue dans le portail et peut également être exportée au format HTML à l'aide de Docsify.

## Encadrés

La navigation et la structure dans docsify et dans le portail s'appuient sur des fichiers appelés `_sidebar.md`

### Barres latérales générées manuellement

Pour conserver le contenu des ressources, la barre latérale est générée et organisée manuellement. `UserGuide` a un `_sidebar.md` généré manuellement

``md
- Guide de l'utilisateur du DataHub scientifique fédéral](/UserGuide/User-Guide.md)

- Pour commencer
  - [Enregistrement du compte](/UserGuide/Preregistration/Preregistration.md)
  - Créer un espace de travail](/UserGuide/GettingStarted/Creating-a-workspace.md)
...

- Tutoriels
  - Comment accéder à votre compte de stockage dans Databricks](/UserGuide/Databricks/Access-your-storage-account-in-Databricks.md)
  ...
```

ce qui est rendu dans le portail sous la forme

![Dans le portail](image-4.png)

Pour empêcher la génération automatique de la barre latérale, un fichier appelé `_sidebar.md.yaml` contient

``yaml
autogénérer : false
```

## Projet SyncDocs

Le projet SyncDoc dans la solution visual studio est utilisé pour :
- Générer automatiquement les sidebars (pour les sidebars qui ont `autogenerate : true` dans yaml)
- Générer une proposition de traduction

### Exécution de SyncDocs

Il peut être exécuté à partir de la ligne de commande, mais les paramètres de lancement prédéfinis peuvent être utilisés.

Cliquez avec le bouton droit de la souris sur le projet et sélectionnez "Setup as Startup Project".

![Configuration en tant que projet de démarrage](image.png)

Les paramètres de lancement prédéfinis supposent que la structure des dossiers est la suivante :

![Structure du dossier](image-5.png)

### Étape 1 : Mise à jour des barres latérales

Sélectionnez la configuration "SyncDocs (sidebars)" dans la barre d'outils et exécutez-la.

![Encadrés](image-1.png)

### Étape 2 : Mise à jour des traductions proposées

Pour mettre à jour les traductions, sélectionnez la configuration "SyncDocs (translate)" dans la barre d'outils et exécutez-la. Cette configuration s'appuie sur le fichier config.deepl.json.

Il est important d'extraire toutes les modifications du site de documentation, car un cache et les traductions éditées manuellement sont sauvegardés dans `fr/translationcache.json`

L'outil supprimera tous les fichiers du répertoire `fr` et les régénérera.

### Glossaire.csv

Des traductions personnalisées peuvent être ajoutées en éditant le fichier `glossary.csv` dans le dossier principal. C'est là que les acronymes et autres traductions doivent être sauvegardés.

![Traduire](image-2.png)

## config.deepl.json

``json
{
  "deepl" : {
    "Key" : "<key>",
    "UseFreeAPI" : true/false
  }
}
``

## Processus d'examen

DataHub suit les directives officielles du GdC en matière de langues et aucune modification du site de documentation ne doit être effectuée sans un examen approprié, que ce soit par le biais d'un commit review ou d'une pull request.
