---
remarks: Automatically translated with DeepL
source: /UserGuide/Databricks/Git-Integration.md
draft: true
---

# Intégration de Git/GitHub avec Databricks

<!---removed due to accessibility requirements
<video width="600" height="350" controls>
    <source src="/api/media/git-integration.mp4" type="video/mp4">
    Votre navigateur ne prend pas en charge la balise vidéo.
</video>
-->

## Pré-requis

- Familiarité avec le contrôle de version Git.
- Avoir accès à un dépôt Git - la création et l'accès à un dépôt n'entrent pas dans le cadre de ce guide.

## Pourquoi utiliser Git/GitHub ?

- Meilleur contrôle de version que le gestionnaire de changement intégré.
- Gérer le code et les carnets en dehors de Databricks.
- Collaboration entre plusieurs espaces de travail.

## Workbook vs Repository

- Une fois que vous avez connecté Git à Databricks, vous pouvez créer et utiliser des carnets de notes comme d'habitude et également les pousser vers GitHub.
- Les fichiers Workbook dans Git ont une syntaxe légèrement différente de celle des carnets Jupyter standard.

## Partie 1 : Configurer Git/GitHub avec Databricks

Accédez à vos paramètres d'utilisateur dans le menu déroulant en haut à droite. Sélectionnez l'onglet Intégration Git.

![image](https://user-images.githubusercontent.com/3179656/236484074-eb2b631a-b130-4eda-8554-26a79bf8bb9d.png)

- Sélectionnez votre fournisseur Git
- Configurer le nom d'utilisateur
- Générer un Token pour donner à Databricks l'accès à votre référentiel

Pour GitHub, les jetons d'accès peuvent être créés dans Settings / Personal Access Token / Tokens (classic). Sur cette page, cliquez sur "Generate new token" puis sur "Generate new token (classic)".
![image](https://user-images.githubusercontent.com/3179656/236484380-d193ae59-1a9c-434e-a7ec-790d691c1a89.png)

Pour des raisons de sécurité, nous recommandons de configurer une date d'expiration inférieure à un an. Les jetons peuvent être facilement régénérés après expiration en suivant les étapes suivantes.

Les scopes requis sont `repo` et `workflow` (optionnel pour les workflows GitHub Actions).
![image](/api/docs/UserGuide/Databricks/TokenScopes.png)

Si le jeton et les autorisations d'accès sont correctement configurés, vous devriez voir une marque verte dans la page des paramètres.

![image](https://user-images.githubusercontent.com/3179656/236485049-c9a97fd0-3737-4c7d-9f3d-58242a32363c.png)

## Partie 2 : Accéder et modifier les référentiels

Pour cloner un dépôt, vous aurez besoin de son lien d'accès HTTPS et de sa branche.

![image](https://user-images.githubusercontent.com/3179656/236485166-3ed15a99-2ad6-4a97-9d17-8f46bbf1c111.png)

Une fois la configuration effectuée, vous pouvez voir les fichiers contenus dans le référentiel
![image](/api/docs/UserGuide/Databricks/GitMenu.png)

Les changements effectués à partir de Databricks peuvent être poussés vers le dépôt en utilisant le menu Git intégré. Pour y accéder, cliquez avec le bouton droit de la souris sur les fichiers de votre dépôt et cliquez sur "Git...".

Cet écran vous permet de valider et d'introduire des modifications, ainsi que d'extraire des modifications existantes.

![image](/api/docs/UserGuide/Databricks/GitMenu2.png)

## Résoudre les conflits

Si plusieurs commits impactent le même code, il peut y avoir un problème de conflit. Le message suivant apparaîtra lors d'une tentative d'extraction de code :

![image](/api/docs/UserGuide/Databricks/MergeConflict.png)

Sélectionnez "Résoudre le conflit à l'aide de la RP", ce qui ouvre la fenêtre suivante :

![image](/api/docs/UserGuide/Databricks/MergeConflict2.png)

Cette étape vous demandera de créer une nouvelle branche dans laquelle vos modifications seront validées. Saisissez un nom de branche et un message de validation, puis validez à nouveau les messages. En cas de succès, le message suivant s'affichera. Vous pouvez suivre le lien contenu dans ce message pour effectuer vos modifications.

![image](/api/docs/UserGuide/Databricks/MergeConflict3.png)

<!-- ## Automatiser les extractions Git

? ? -->
