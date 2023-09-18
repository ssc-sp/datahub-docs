---
remarks: Automatically translated with DeepL
source: /UserGuide/Tutorials/Build-deploy-webapp.md
draft: true
---

# Développez, construisez et déployez vos applications web

## Objectifs

- Héberger une application web
- Base de données de l'hôte
- Application de recherche personnalisée/base de données scientifiques

## Architecture

### GitHub
- **Code:** Python, Djando web framework, Django ORM. L'application Node.js serait très similaire.
- **Dépôt de conteneurs:** Dépôt de conteneurs public sur GitHub. GitHub peut fournir des dépôts privés.
- **Actions:** Empaqueter l'application et la déployer dans Github Packages (Container Registry). Une fois là, elle peut être déployée sur n'importe quel système qui supporte Docker Compose.

### PostgresSQL
- Base de données standard, supporte les extensions géospatiales
- Il peut s'agir de SQL Server ou de MariaDB
- SQLlite est recommandé lorsqu'il est recommandé en raison des performances et des coûts pour les ensembles de données de petite/moyenne taille.

### Django
- Cadre de travail Python pour le développement d'applications web.
- Outils et composants intégrés pour des tâches telles que la gestion de bases de données et le routage d'URL.
- Nombreux frameworks, hébergement web + mappeur d'objets

## Docker Compose

- Paquet
- Extension de docker, fournit l'orchestration de docker
- Ce n'est pas une alternative à Kubernetes. De nombreuses fonctionnalités ne sont pas prises en charge aujourd'hui (mise à l'échelle, distribué, etc.).
- Modèle simple pour empaqueter des systèmes qui ne peuvent pas tenir dans un seul docker

- Pas le premier choix
    - Un seul docker est préférable si possible
- Docker compose permet de construire une application avec plusieurs images - aka plusieurs serveurs. Utilisez le modèle ou contactez Datahub

- Expérience requise
    - Réseau : tous les ports nécessaires doivent être spécifiés
    - Stockage : le stockage persistant doit être géré
    - Les modifications apportées aux images ne sont pas conservées après le redémarrage.

## Fonctionne localement

- Le bureau Docker a ses limites
- Options
    - Application de bureau Docker - risque de limitation de licence
    - WSL - un peu plus à apprendre
    - Créer une machine virtuelle (HyperV ou VirtualBox)
- L'option de déploiement doit être discutée avec l'équipe des ordinateurs de bureau du département.
- Statistiques sur la mémoire ?
    - Très peu de frais généraux pour Docker

### Mise à jour/test de l'application localement :

1. Installez Docker dans votre environnement préféré. Docker Compose est inclus pour Windows/Mac, mais doit être installé manuellement en utilisant `pip install docker-compose` sur Linux.
    * Vous pouvez confirmer l'installation en utilisant `docker run hello-world` pour obtenir une image d'exemple.
2. Pour utiliser Django, il y a quelques commandes clés :
    * Créer un projet : `django-admin startproject django_project`
    * Créer des migrations : `python manage.py makemigrations` (Doit être fait après les changements de modèle)
    * Migrer : `python manage.py migrate` (Doit être fait après les changements de modèle)
    * Exécuter le serveur : `python manage.py runserver`
        * Permet de visiter le site web localement à l'adresse `http://127.0.0.1:8000/`.
3. Vous devez lancer `pip freeze > requirements.txt` après avoir configuré ceci. Ce fichier permet à Docker d'installer et d'utiliser vos paquets Python.
4. Créez un `Dockerfile`, vous pouvez utiliser le fichier de démonstration sur [datahub-demos] (https://github.com/ssc-sp/datahub-demos/blob/main/docker/django-app/Dockerfile) comme point de départ.
    * Ce fichier installe Python, vos exigences, et définit votre page Django comme répertoire de travail.
5. Créez un fichier `docker-compose.yml`, vous pouvez utiliser le fichier de démonstration sur [datahub-demos] (https://github.com/ssc-sp/datahub-demos/blob/main/docker/django-app/docker-compose.yml) comme point de départ.
    * Ce fichier démarre les services web et de base de données pour votre projet.
    * **Note:** Si vous utilisez le fichier d'exemple, vous devez mettre à jour `django_project/settings.py` pour utiliser PostgreSQL au lieu de SQLite.
6. Vous pouvez maintenant utiliser `docker-compose up` pour démarrer le conteneur Docker. Si vous réussissez, vous pouvez le visiter à `http://127.0.0.1:8000/`.
    * Vous pouvez également utiliser `docker-compose up -d --build` pour fonctionner en mode détaché, ce qui signifie que vous pouvez faire des changements sans constamment démarrer/arrêter le conteneur.
    * Vous pouvez utiliser `docker-compose down` pour arrêter le conteneur.
    * Lors de l'exécution de ce conteneur, utilisez `docker-compose exec web python manage.py ...` pour exécuter les scripts `migrate` ou `makemigrations`.

## Déploiement de l'application dans le nuage

- Actions GitHub
    - Lorsque le référentiel est modifié, l'image docker est construite et déployée.
    - L'exemple de workflow d'actions Github de la DHSF est disponible à l'adresse suivante : https://github.com/ssc-sp/datahub-demos/blob/main/.github/workflows/azure-container-webapp.yml
    - Montrez comment vous pouvez cloner le repo et configurer l'action dans votre propre
    - Validation de la construction

## Accès à l'application dans DataHub

- L'application sera déployée dans Azure derrière un proxy
- Le lien sera accessible dans l'espace de travail DataHub
- L'équipe de DataHub met en place un déploiement backend dans Azure Devops pour automatiser le déploiement de Github vers Azure

- Coût dans Datahub
    - Plan limité à 7-8 Go de RAM, 4 cœurs de CPU
    - La mise à l'échelle horizontale n'est pas disponible
    - Tous les conteneurs Docker partageront les ressources
    - Plan de base B3
    - ~ CAD$66/mois
