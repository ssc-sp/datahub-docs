---
remarks: Automatically translated with DeepL
source: /UserGuide/Storage/Import-GCP-Storage.md
draft: true
---

# Importation d'un compte Google Cloud Platform existant

Pour importer un compte de stockage GCP, vous devez créer un compte de service ayant accès au stockage et créer une paire de clés pour le compte.

1. Dans le menu principal de Google Cloud, sous la section **IAM & Admin**, naviguez jusqu'à **Comptes de service**.  
![Comptes de service dans le menu](/api/docs/UserGuide/Storage/import_gcp-01.png)

2. En haut de l'écran, cliquez sur **Créer un compte de service** et remplissez les informations relatives au compte. L'identifiant du compte de service est généré automatiquement par défaut, mais vous pouvez le générer à nouveau ou saisir manuellement la valeur de votre choix.  
![Bouton de création de compte](/api/docs/UserGuide/Storage/import_gcp-02.png)
![Détails du compte de service](/api/docs/UserGuide/Storage/import_gcp-03.png)

3. Après avoir créé l'utilisateur, cliquez sur son nom d'utilisateur dans la liste et accédez à l'onglet **Keys**. À partir de là, cliquez sur le bouton **Add Key** (Ajouter une clé) et sélectionnez **Create new key** (Créer une nouvelle clé). À l'invite, assurez-vous que **JSON** est sélectionné et cliquez sur le bouton **Créer**. Cela créera un fichier .json et le téléchargera sur votre ordinateur.  
![Page utilisateur du compte de service](/api/docs/UserGuide/Storage/import_gcp-04.png)
![Boîte de dialogue Créer une clé privée](/api/docs/UserGuide/Storage/import_gcp-05.png)

Pour importer le compte GCP dans Datahub, ouvrez le fichier .json dans un éditeur de texte et collez le contenu dans la zone de texte **Service Account Credentials (JSON)** dans Datahub.  
![Dialogue d'importation du stockage des BPC](/api/docs/UserGuide/Storage/import_gcp-06.png)
