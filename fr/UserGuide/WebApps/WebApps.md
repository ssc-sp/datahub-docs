# Hébergement d'applications Web sur DataHub

Le DataHub scientifique fédéral vous permet d'héberger des applications web sur la plateforme. Ce guide vous guidera à travers le processus de développement, de construction et de déploiement d'applications web sur le DataHub.

> **Note:** Cette fonctionnalité est destinée à un usage interne et expérimental par les utilisateurs de votre espace de travail uniquement. Les applications web ne sont accessibles qu'aux utilisateurs de votre espace de travail DataHub et uniquement au sein du réseau GC.

## Conditions préalables

**Image de votre demande**

Avant de pouvoir héberger des applications web sur le DataHub, vous devrez créer une image de votre application à l'aide de Docker. Docker est une plateforme permettant de développer, d'expédier et d'exécuter des applications dans des conteneurs. Les conteneurs permettent à un développeur d'emballer une application avec toutes les parties dont elle a besoin, telles que les bibliothèques et autres dépendances, et de l'expédier en un seul paquet. Ces conteneurs sont utilisés par le DataHub pour héberger vos applications web.

Pour créer une image de votre application, nous recommandons d'utiliser les GitHub Actions pour construire et pousser l'image vers un registre de conteneurs. Pour commencer, créez un dossier appelé `.github` à l'intérieur de votre repo. Ensuite, ajoutez un dossier appelé `workflows` à l'intérieur du dossier `.github`. Vous pouvez maintenant créer un fichier `.yml` (par exemple, `build-image.yml`) à l'intérieur de ce dossier pour définir le flux de travail des GitHub Actions.

Un exemple de workflow GitHub Actions pour construire et pousser une image Docker vers un registre de conteneurs est [disponible ici] (https://github.com/Sean-Stilwell/sample-dashapp/blob/master/.github/workflows/build-dash-app.yml). Vous devrez mettre à jour le nom de l'image pour qu'il corresponde à celui que vous souhaitez.

**Note:** N'envoyez pas d'informations sensibles, telles que votre jeton GitHub, à votre dépôt. Les actions GitHub peuvent récupérer de nombreux secrets automatiquement, comme le secret `GITHUB_TOKEN`. Vous pouvez également créer vos propres secrets dans les paramètres du dépôt et les utiliser dans vos flux de travail pour éviter d'exposer des informations sensibles.

Si vous n'êtes pas familier avec Docker ou GitHub Actions, vous pouvez contacter l'équipe de support de DataHub pour obtenir de l'aide dans la création d'une image Docker de votre application.

**App Service dans votre espace de travail**

Pour héberger des applications web sur le DataHub, vous devez disposer d'un App Service dans votre espace de travail. Vous pouvez provisionner un App Service dans la boîte à outils de votre espace de travail.

## Déploiement de votre application

**Créer un dépôt Git et un fichier Docker Compose**

Pour héberger une application web sur le DataHub, vous devrez créer un dépôt Git pour votre application. Ce dépôt doit inclure le fichier `docker-compose.yml` utilisé pour déployer l'application sur le DataHub. Il peut optionnellement inclure le fichier Docker utilisé pour créer l'image de votre application.

> **Note:** Votre repo peut être public ou privé, mais vous devrez fournir un jeton pour accéder au repo lors de la configuration dans une étape ultérieure.

**Déployer l'application**

Pour déployer votre application sur le DataHub, vous devez configurer l'App Service dans votre espace de travail. Vous pouvez le faire en naviguant vers l'App Service dans votre espace de travail et en cliquant sur "Configurer".

![Accès au menu de configuration du service d'application](/api/docs/UserGuide/WebApps/configure.png)

Dans l'écran de configuration, vous devrez fournir les informations suivantes :

** URL du dépôt** : L'URL du dépôt Git pour votre application.
**Confidentialité du référentiel** : Si le référentiel est public ou privé.
* **Path** : Le chemin vers le fichier `docker-compose.yml` dans votre référentiel.
* (si privé) **Token** : Un jeton permettant d'accéder au référentiel.

![Menu de configuration d'un service applicatif](/api/docs/UserGuide/WebApps/configure-2.png)

Après avoir fourni ces informations, cliquez sur `Save` pour déployer votre application sur le DataHub.

**Accéder à votre demande**

Une fois que votre application est déployée sur le DataHub, vous pouvez démarrer le service pour accéder à votre application web. Vous pouvez le faire en naviguant vers l'App Service dans votre espace de travail et en cliquant sur `Start`.

Une fois le service démarré, vous pouvez accéder à votre application web en cliquant sur le lien `Proxy URL` dans l'App Service.

[Accès à l'URL du proxy pour votre application web](/api/docs/UserGuide/WebApps/access.png)

> **Note:** Après avoir démarré le service, l'application peut prendre quelques minutes pour être accessible via l'URL du proxy. Si vous rencontrez des problèmes, veuillez contacter l'équipe de support de DataHub pour obtenir de l'aide.

## Applications de démonstration

L'équipe DataHub a créé quelques applications de démonstration pour vous aider à démarrer l'hébergement d'applications web sur la plateforme. Ces dépôts comprennent le fichier Docker utilisé pour créer l'image et le fichier Docker Compose utilisé pour déployer l'application sur DataHub.

Ces applications sont disponibles sur GitHub :

* [Django (Python)](https://github.com/ssc-sp/datahub-demos/tree/main/docker/django-app)
* [Dash (Python)](https://github.com/Sean-Stilwell/sample-dashapp)

Ces applications sont conçues pour être facilement déployées sur le DataHub à l'aide de Docker Compose.

## Obtenir de l'aide

Si vous n'êtes pas familier avec Docker Compose ou si vous avez besoin d'aide pour déployer votre application web sur le DataHub, veuillez contacter l'équipe d'assistance du DataHub pour obtenir de l'aide. Nous sommes là pour vous aider à démarrer l'hébergement d'applications web sur la plateforme.
