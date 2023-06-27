---
remarks: Automatically translated with DeepL
source: /DeveloperGuide/Resourcing/Resourcing-Terraform-Structures.md
draft: true
---

## Repo d'infrastructure (publique)

Le référentiel d'infrastructure public est utilisé pour stocker les modèles et les modules qui sont utilisés pour créer l'infrastructure de l'espace de travail.

```
root/
  Modèles/
    new-workspace-template/ // espace de travail de base
    azure-blob-storage/ // caractéristiques
    espace de travail databricks/
    ..
    azure-blob-storage-users/ // synchronisation des utilisateurs
    databricks-workspace-users/
    ..

  modules/
    azure-storage/
      main.tf // inclut des métadonnées pour piloter l'interface utilisateur
      ..
    azure-databricks/
    ..
```

## Repo d'infrastructure (privé)

La disposition finale de l'infrastructure privée contiendra un dossier pour chaque espace de travail, avec des fichiers `.tf`, un fichier `variables.tfvars`, et un fichier `values.json`.

Les fichiers `.tf` du répertoire de l'espace de travail contiendront les modules pour l'espace de travail, et le fichier `variables.tfvars` contiendra les variables qui sont requises pour les modules.

Le fichier `values.json` contiendra les valeurs des variables du fichier `variables.tfvars`. Le fichier `values.json` sera crypté à l'aide du [Azure Key Vault](https://docs.microsoft.com/en-us/azure/key-vault/general/basic-concepts) et du [Azure Key Vault Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_key_vault) pour Terraform.

## Disposition des sous-répertoires de l'espace de travail

```
root/
  terraformer/
    WRK1/
      main.tf
      variables.tfvars
      valeurs.json
      feature-1.tf
      feature-4.tf
      ..
    WRK2/
      main.tf
      variables.tfvars
      valeurs.json
      feature-7.tf
      feature-10.tf
      feature-11.tf
      ..
    WRK3/
    WRK4/
    WRK5/
    ..
```

### Exemple de modification d'une fonction

```
root/
  terraformer/
    WRK1/
      main.tf
      ~~ variables.tfvars
      ~~ values.json
      feature-1.tf
      feature-4.tf
      ++ storage-module-<id>.tf
```
