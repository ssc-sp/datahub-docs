[_metadata_: remarks]:- "Automatically translated with DeepL. From: /Postgresql-Resources.md"

[_(draft documentation, please review)_](/Postgresql-Resources.md)

# Postgresql Azure

## Modèle d'authentification

Datahub ne prend en charge que les instances gérées de Postgresql déployées dans Azure. Pour s'authentifier auprès de la base de données, il est nécessaire de suivre le modèle Azure qui requiert un jeton.

## Outils supportés

- [pgAdmin](https://www.pgadmin.org/)

## Instructions de démarrage rapide

### Configuration initiale
1. Téléchargez et installez pgAdmin
2. Créer un nouveau serveur
   - cliquez avec le bouton droit de la souris sur l'élément **Servers** dans l'onglet Navigateur
   - Dans le menu contextuel, sélectionnez **Créer** -> **Serveur**.
3. Dans la boîte de dialogue Create Server, ouvrez l'onglet **Connection** et entrez le **Nom d'hôte de la base de données** et le **Nom d'utilisateur de la base de données** indiqués ci-dessus dans les zones de texte **Nom/adresse de l'hôte** et **Nom d'utilisateur**, respectivement.
   - Note : **Ne saisissez pas** de mot de passe à ce stade.
4. Dans l'onglet SSL, définissez le **Mode SSL** sur **Require**.
5. Sauvegardez le serveur que vous avez configuré

### Connexion à la base de données
1. Obtenez un jeton d'accès en utilisant l'une des méthodes suivantes :
    #### Utilisation du portail Datahub
      1. Cliquez sur le bouton Générer un jeton ci-dessus.
      1. Cliquez sur le bouton de copie pour copier le jeton dans votre presse-papiers.
    #### Utilisation de l'interface de ligne de commande Azure dans PowerShell ou CMD
      1. Entrez `az login`. Cela fera apparaître une fenêtre de navigateur pour confirmer le nom d'utilisateur. Il se peut que l'on vous demande de vous reconnecter.
      1. Entrez `az account get-access-token --resource-type oss-rdbms`. Ceci retournera un objet JSON :
         ```
         {
           "accessToken" : "[une longue chaîne de caractères]",
           "expiresOn" : "[date et heure]",
           "abonnement" : "...",
           "locataire" : "...",
           "tokenType" : "Bearer"
         }
         ```
      1. Sélectionnez et copiez le contenu de la propriété `accessToken`.
1. Dans pgAdmin, faites un clic droit sur le serveur précédemment créé et sélectionnez **Connect Server**.
   - vous pouvez également double-cliquer sur le serveur pour vous y connecter
1. Une boîte de dialogue demandant votre mot de passe devrait apparaître - collez-y le jeton d'accès.
   - Note : **Ne cochez pas** la case "Enregistrer le mot de passe", car votre jeton d'accès expirera après un certain temps et vous aurez besoin d'un nouveau jeton pour vous connecter.
1. Cliquez sur **Ok** pour vous connecter au serveur.
