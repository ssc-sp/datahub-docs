[_metadata_: remarks]:- "Automatically translated with DeepL. From: /Cloud-Team-Requirement-for-Running-DataHub-Terraform.md"

[_(draft documentation, please review)_](/Cloud-Team-Requirement-for-Running-DataHub-Terraform.md)


## Prereq
Les exigences suivantes doivent être satisfaites en dehors de ce code Terraform à l'avance. Certaines tâches doivent être effectuées par un utilisateur plus privilégié (par exemple, l'équipe d'exploitation du Cloud de l'organisation). Les informations seront introduites dans les fichiers TF spécifiques à l'environnement (par exemple env/dev.tf). Ce code Terraform génère également une sortie pour montrer les informations importantes qui seront utilisées pour d'autres tâches (comme la connexion avec un WAF centralisé pour l'organisation).

1. Création d'un nouveau groupe de ressources (par exemple, fsdh-dev-rg où dev signifie DEV) pour héberger l'application DataHub Portal.
2. Créez un nouveau groupe AAD en utilisant la convention de nommage `fsdh-group-admin-dev` pour les utilisateurs de l'administration système (par exemple dev est pour DEV). Ce groupe doit avoir les rôles Azure suivants
   - Propriétaire du groupe de ressources
3. Créer un nouveau groupe AAD en utilisant la convention de nommage `fsdh-group-dba-dev` pour les utilisateurs DBA (par exemple dev est pour DEV). Ce groupe sera assigné comme DBA pour les bases de données gérées par Azure.
4. Créez un compte de stockage séparé dans un groupe de ressources dédié pour stocker l'état du backend Terraform. Accordez le rôle de contributeur au groupe admin ;
5. Créez un nouvel enregistrement d'application (par exemple fsdh-app-dev) pour l'application du portail Datahub et créez un secret client. L'enregistrement de l'application doit avoir un jeton d'identification activé et les permissions suivantes :
     |Permission | Type | Accordé par|.
     |--|--|--|
     |User.Read | Delegated | Admin consent|.
     | User.ReadBasic.All |Delegated| Admin consent|
     |User.Read.All|Delegated| Admin consent|
     |Directory.Read.Alll|Delegated| Admin consent|
     |Directory.AccessAsUser.All|Delegated| consentement de l'administrateur|.
     |User.Invite.All|Application| Consentement de l'administrateur|.
     |Directory.Read.All|Application| Admin consent|.
     |User.Read.All|Application| Admin consent|
   - Permissions accordées User.Invite.All et GroupMember.ReadWrite.All. Le consentement de l'administrateur a été accordé
5. Créez un nouvel enregistrement d'application (par exemple, fsdh-billing-dev) pour appeler l'API de facturation. L'enregistrement de l'application doit avoir le rôle de "lecteur de gestion des coûts".
6. Créez le coffre-fort "fsdh-key-env" et créez la politique d'accès au coffre-fort pour l'utilisateur qui exécute Terraform.
7. Création des secrets "datahubportal-client-id" et "datahubportal-client-secret" pour correspondre à l'enregistrement de l'application.
8. Création des secrets "datahub-smtp-username" et "datahub-smtp-password" pour l'authentification SMTP.
9. Création du secret "deepl-authkey" dans Key Vault
10. Création des secrets "terraform-backend-key" et "terraform-backend-storage".
11. Fichier spécifique à l'environnement rempli (par exemple env/dev/dev.tf)
