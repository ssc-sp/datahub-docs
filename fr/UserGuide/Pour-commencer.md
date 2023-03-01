---
remarks: Automatically translated with DeepL
source: /UserGuide/Getting-Started.md
draft: true
---

# Welcome

## Évaluation de la preuve de concept

Vous recevrez des formulaires en ligne d'évaluation du PoC à intervalles réguliers et vous devrez les remplir avant la date indiquée par l'équipe Data Solutions.

## Accès/Inscription
Vous devez avoir été intégré à l'environnement par l'équipe SSC avant de pouvoir accéder au DataHub. Si vous n'avez pas été informé de votre intégration, veuillez contacter [l'équipe Data Solutions] (mailto:datasolutions-solutiondedonnees@ssc-spc.gc.ca) pour plus de détails.

Voir **[Sign-in Instructions](https://github.com/ssc-sp/datahub-portal/wiki/Sign-in-Instructions)** pour des instructions détaillées sur l'accès au SSC DataHub.

## Page d'accueil de DataHub

Commencez par la page d'accueil du SSC Datahub : https://datahub-test.scienceprogram.cloud/

![image](https://user-images.githubusercontent.com/99416857/153502021-85037044-830b-424c-b4a7-761b602fbe31.png)

**Description de la page d'accueil**

![image](https://user-images.githubusercontent.com/99416857/153505232-4f489ef1-6a13-4c2a-9879-a6c5363cbb0f.png)


# Flux de travail et capacités

## 1. Trouvez vos projets et outils de données
* Sélectionnez Mes projets sur la page d'accueil pour trouver le ou les projets qui ont été configurés pour vous.
![image](https://user-images.githubusercontent.com/99416857/153502246-f724f3b7-e2e8-4a4e-b5af-2e4b7a6e2cee.png)

Si vous n'avez pas accès au projet qui vous a été attribué, cliquez sur le bouton **Demander l'accès**. Votre demande sera examinée et vous serez informé lorsque l'accès vous sera accordé.

**Review Project Toolset**

* **Stockage du projet** : Accédez au compte de stockage de ce projet pour charger, télécharger et partager des ensembles de données avec tous les membres du projet. (Un compte de stockage Azure est attribué au projet par l'équipe d'administration de DataHub).
**Azure Databricks** :  Exécutez vos carnets Python, R et SQL dans le cloud avec Databricks pour l'analyse, l'apprentissage automatique et les pipelines de données. (

## 2. Stocker et partager des données

### Chargement et téléchargement de données :
 **Projet de stockage : Storage Explorer**
 Deux options sont disponibles pour le chargement et le déchargement.
* L'interface **Drag and drop** est accessible en haut de la page de l'explorateur de stockage. Cet outil permet aux utilisateurs de charger et de télécharger des fichiers.
 Voir les éléments de menu pour les fonctions disponibles
![image](https://user-images.githubusercontent.com/99416857/153503195-fb5e9a51-1ac1-44db-b7d1-9aeef71017f4.png)

**AzCopy** (ligne de commande) : c'est l'option recommandée pour travailler avec des fichiers volumineux et l'outil peut également être intégré dans des scripts.
  * Vous aurez également besoin d'un accès AzCopy pour pouvoir charger/télécharger des fichiers avec cette méthode.
  * Le token SAS (Shared Access Signature) est un "moyen sécurisé d'accorder un accès limité aux ressources de votre compte de stockage". Si vous quittez la page après avoir généré un jeton, vous devrez répéter l'opération, à moins que vous n'ayez sauvegardé le jeton. Le système fournit un jeton de 14 jours, vous pouvez demander un jeton SAS à durée prolongée auprès de l'équipe Data Solutions.
  * Se référer à la section de l'explorateur de stockage "**Utiliser AzCopy pour interagir avec le compte de stockage Azure**" pour des détails sur l'utilisation d'AzCopy. Le [DataHub Video Tutorial - AzCopy focus] (https://dhdemosand.blob.core.windows.net/datahub/Data%20Sharing%20Tutorial.mp4?sv=2020-10-02&st=2022-02-09T20%3A22%3A12Z&se=2023-02-10T20%3A22%3A00Z&sr=b&sp=r&sig=OeNPrxbhVMshileL39VKre%2FQBBYfUae5gz1M%2Fsyo3JY%3D) fournit également des instructions détaillées sur la configuration et l'utilisation d'AzCopy.

### Bases de données :
  * Si votre projet est doté d'outils de base de données, veuillez contacter l'équipe Data Solutions car les instructions dépendront de la base de données.

#### Données de partage :
Les collaborateurs doivent avoir un compte DataHub et se voir attribuer un accès à votre projet. Pour demander un compte pour vos collaborateurs, envoyez un courriel à la [boîte aux lettres Data Solutions] (mailto:datasolutions-solutiondedonnees@ssc-spc.gc.ca).


## **3. Carnet de notes (Databricks)**
* Fonctionnalité qui sera activée plus tard dans le cadre de la validation du concept.
## **4. Estimation des coûts**
Fonctionnalité qui sera activée ultérieurement dans le toit du concept P*.

# Règles

## Termes et conditions
_(Lien)_

## Métadonnées
* Le profil de métadonnées n'est pas encore activé - TBD.


# Rôles
![image](https://user-images.githubusercontent.com/99416857/153506295-b6fa92f2-0dc3-4859-8c95-7e6868f09c95.png)


# Soutien
Si vous rencontrez des problèmes lors de l'utilisation du SSC DataHub, veuillez contacter [Data Solutions mailbox] (mailto:datasolutions-solutiondedonnees@ssc-spc.gc.ca) et un membre de notre équipe vous contactera dès que possible.



# Questions fréquemment posées

**1. Quel est l'objectif et le champ d'application de cette démonstration de faisabilité ?
Prouver le concept d'un environnement en nuage pour le stockage et le partage des données scientifiques du GC qui réduit les obstacles à la collaboration en intégrant les capacités en nuage dans les applications scientifiques locales existantes (par cas d'utilisation).
Commencer l'évaluation des capacités actuelles de la preuve de concept du SSC Data Hub avec les cas d'utilisation du SBDA et identifier les activités supplémentaires, les cas d'utilisation, les capacités / caractéristiques pour les prochains sprints et ou PoCs.

**2. Quelles sont les capacités à évaluer?** Stockage en nuage, partage, collaboration sur ordinateur portable

**3. Où vivent les données ?
Le cloud Azure de SSC - hébergé au Canada.

**4. Que vont devenir les données à la fin du PoC ?
Les options sont détruire ou migrer vers un autre environnement spécifié par l'utilisateur.

**5. Qu'est-ce qu'un compte de stockage Azure ?
Il existe deux types principaux de comptes de stockage - ceux-ci sont activés par le SSC et l'accès est fourni par l'équipe DataHub :
* Azure Blob Storage - compte de stockage de base - ne fournit pas de contrôle d'accès au niveau des fichiers et des dossiers mais est requis pour la compatibilité dans certains scénarios.
* Azure Data Lake Storage (Gen2) - conçu pour l'analyse des données volumineuses et fournissant des listes de contrôle d'accès au niveau des fichiers et des dossiers.

**6. Puis-je avoir plus d'un Storage Explorer ?
Oui, cela sera disponible dans les prochains sprints. Cela vous permettra de garder certaines données internes à votre équipe et de partager certaines données.

**7. Que faire si j'ai besoin de plus que l'allocation de 10 To ?
Pour le PoC, nous essayons de limiter la taille des fichiers. Toutefois, si vous avez besoin de plus d'espace de stockage, veuillez envoyer un courriel à la boîte aux lettres Data Solutions et votre demande sera examinée.

**8. Aurai-je des problèmes à utiliser le DataHub avec un VPN ?
Vous devrez peut-être vous déconnecter de votre VPN pour télécharger des fichiers.
De plus, il est recommandé d'exécuter AzCopy via le bureau à distance pour un téléchargement plus rapide, car le VPN sera lent.

**9. Le fichier sera-t-il téléchargé sur mon compte personnel ou ira-t-il directement dans le projet Data ?
En supposant que vous êtes dans le "stockage de projet", il ira dans le stockage de projet.  

**10. Le système m'indique qu'il faudra 3 à 7 heures pour télécharger le fichier. Est-ce normal compte tenu de la taille et de l'utilisation de l'option glisser-déposer ?
Nous ne recommandons pas l'utilisation de l'upload web - car il passe par plusieurs couches pour atteindre le stockage. Aussi, une vitesse lente à cet endroit peut être difficile à diagnostiquer. Veuillez utiliser AzCopy - nous avons créé une vidéo à ce sujet : [DataHub Video Tutorial - AzCopy focus](https://dhdemosand.blob.core.windows.net/datahub/Data%20Sharing%20Tutorial.mp4?sv=2020-10-02&st=2022-02-09T20%3A22%3A12Z&se=2023-02-10T20%3A22%3A00Z&sr=b&sp=r&sig=OeNPrxbhVMshileL39VKre%2FQBBYfUae5gz1M%2Fsyo3JY%3D)



***
