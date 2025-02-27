---
remarks: Automatically translated with DeepL
source: /DeveloperGuide/Contributing/Contributing-Overview.md
draft: true
---

## Introduction

Voici un aperçu rapide de la configuration d'un environnement permettant de contribuer au projet Datahub.

## Conditions préalables

- [.NET Core SDK 6.0.x](https://dotnet.microsoft.com/en-us/download/dotnet/6.0)
- [Powershell](https://github.com/powershell/powershell#readme)

Un de :

- [Visual Studio](https://visualstudio.microsoft.com/downloads/)
- [JetBrains Rider] (https://www.jetbrains.com/rider/)
  - Note : Pour pouvoir utiliser JetBrians Rider, une licence est nécessaire. Une licence d'étudiant peut être obtenue gratuitement avec un email d'étudiant.

## Démarrage

### Visual Studio

Clonez le référentiel :

![clone](../../../static/vs/clone.png)

Remplissez `L'emplacement du référentiel` avec le lien du référentiel de Datahub : `https://github.com/ssc-sp/datahub-portal.git` et sélectionnez un chemin vers le répertoire parent qui contiendra le référentiel.

![repo](../../../static/vs/repo.png)

TENTATIVE : Afin de configurer les paramètres de construction correctement, envoyez une demande au propriétaire du projet, ou alternativement **si vous êtes un stagiaire SPC**, envoyez une demande à `matteo.gisondi@ssc-spc.gc.ca` pour le schéma `appsettings` approprié.

Copiez le schéma dans le répertoire `Datahub.Portal`.

Sélectionnez le schéma approprié dans la barre supérieure, et cliquez sur run/debug pour lancer l'application dans le navigateur.

![schéma](../../../static/vs/schema.png)

Si vous y êtes invité, faites confiance au certificat SSL :

![certificat ssl](../../../static/vs/ssl_cert.png)

et sélectionnez oui sur l'avertissement de sécurité :

! [alerte de sécurité](../../../static/vs/security_warning.png)

### JetBrains Rider

Initialiser un nouveau projet :

! [nouveau projet](../../../static/rider/new.png)

Remplissez `URL` avec le lien du référentiel de Datahub : `https://github.com/ssc-sp/datahub-portal.git` et sélectionnez un chemin vers le répertoire parent qui contiendra le dépôt. Si `git` n'est pas installé, cliquez sur `Download and Install` ; Si l'installation échoue, acquérez `git` depuis [https://git-scm.com/downloads](https://git-scm.com/downloads).

![vc](../../../static/rider/vc.png)

Une fois cloné, si vous y êtes invité, sélectionnez "Trust and Open".

![confiance](../../../static/rider/trust.png)

TENTATIVE : Afin de configurer les paramètres de construction correctement, envoyez une demande au propriétaire du projet, ou alternativement **si vous êtes un stagiaire SPC**, envoyez une demande à `matteo.gisondi@ssc-spc.gc.ca` pour le schéma `appsettings` approprié.

Copiez le schéma dans le répertoire `Datahub.Portal`.

Sélectionnez le schéma approprié dans la barre supérieure, et cliquez sur run/debug pour lancer l'application dans le navigateur.

![run](../../../static/rider/run.png)
