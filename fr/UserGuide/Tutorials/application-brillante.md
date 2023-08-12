---
remarks: Automatically translated with DeepL
source: /UserGuide/Tutorials/shiny-app.md
draft: true
---

# Hébergement d'une application Shiny avec DHSF

DHSF peut héberger votre application Shiny interactive qui doit fonctionner en permanence et qui s'adresse à un plus grand nombre d'utilisateurs ;

- Azure App Service est utilisé pour héberger vos applications Shiny qui s'exécutent dans un conteneur Docker. Le coût est généralement inférieur à 100 $ par mois ;
- Il n'est pas nécessaire de connaître Docker. Cependant, si vous avez déjà documenté votre application Shiny, DHSF peut également l'héberger. Veuillez contacter le support DHSF.
- DHSF fournit l'authentification pour votre application Shiny sans aucun changement de code. En option, vous pouvez toujours contrôler les permissions des utilisateurs dans le code de votre application Shiny ;

# Critères

- Votre application Shiny n'accède qu'aux fichiers de votre compte de stockage Azure et non à d'autres sources de données telles que les bases de données ;
- Votre application Shiny ne nécessite pas plus de 8 Go de mémoire pour fonctionner correctement ;
- Votre application Shiny n'est accessible qu'aux utilisateurs enregistrés de la DHSF ;

# Développer une application Shiny

Vous pouvez développer et tester le code de votre application Shiny sur votre PC local. Pour accéder à votre stockage DHSF, connectez-vous et générez un jeton SAS dans DHSF. Une fois déployé, votre code Shiny a accès aux variables d'environnement suivantes :

|Nom de la variable d'environnement| Type | Description |
| --- | --- | --------- |
|Le nom de votre compte de stockage DHSF (par exemple, mysuperprojet).
|La clé d'accès à votre compte de stockage DHSF.
|Le conteneur de blob utilisé par DHSF (typiquement "`datahub`").
|L'URL de base de votre stockage DHSF peut être utilisée dans votre code (par exemple https://mysuperproject.blob.core.windows.net) sans conteneur ni dossier.
|BLOB_SAS_TOKEN|string|Le jeton SAS peut être utilisé pour initialiser un client Azure Blob API (par ex. `sv=2012-02-12&st=2009-02-09&se=2009-02-10&sr=c&sp=r&si=YWJjZGVmZw%3d%3d&sig=dD80ihBh5jfNpymO5Hg1IdiJIEvHcJpCMiCMnN%2fRnbI%3d`)|

L'extrait de code R suivant illustre comment l'application Shiny se connecte aux comptes de stockage DHSF et lit un fichier :

```
# Obtenir les détails du compte de stockage Azure
storage_account_name <- Sys.getenv("BLOB_ACCOUNT_NAME")
storage_account_key <- Sys.getenv("BLOB_ACCOUNT_KEY")
nom_du_conteneur <- Sys.getenv("BLOB_CONTAINER_NAME")

# Lire le fichier CSV depuis Azure Blob Storage
bl_endp_key <- storage_endpoint(paste("https://", storage_account_name, ".blob.core.windows.net", sep = ""), key=storage_account_key)
cont <- storage_container(bl_endp_key, "datahub")
data <- storage_read_csv(cont, "myfile.csv")
```

# Déployer l'application Shiny

Une fois que votre application Shiny est prête à être déployée, vous pouvez la déployer en copiant simplement les fichiers sur votre compte de stockage DHSF dans le dossier `shiny`. (Le nom du dossier peut être configuré). Le système exécutera le fichier `app.R` au lancement.

# Accès à l'application Shiny
Une fois déployée, votre application Shiny sera accessible à https://federal-science-datahub.canada.ca/wsapp/PROJ/shiny/ (`PROJ` est l'acronyme de votre projet et `shiny` est le nom du dossier dans votre stockage DHSF).
