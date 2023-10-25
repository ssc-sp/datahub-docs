---
remarks: Automatically translated with DeepL
source: /AdminGuide/migrate-to-versioning.md
draft: true
---

# Migration des espaces de travail DHSF vers des modules versionnés

# Préparer
1. Se connecter à Azure
2. Changer de répertoire pour le répertoire du projet
3. Exécutez les opérations suivantes :
    ```
    terraform state rm module.azure_databricks_module.databricks_user.datahub_dbk_user
    terraform state rm module.azure_databricks_module.databricks_group_member.datahub_dbk_admin_member
    terraform state rm module.azure_databricks_module.databricks_group_member.datahub_dbk_lead_member
    terraform state rm module.azure_databricks_module.databricks_group_member.datahub_dbk_all_member
    terraform state rm module.azure_storage_blob_module.azurerm_role_assignment.storage_contributor_assignment
    terraform state rm module.azure_storage_blob_module.azurerm_role_assignment.storage_reader_assignment
    ```
# Mise à niveau
1. Obtenir la configuration de l'ancien projet (DHSF > Espaces de travail > rechercher et ouvrir l'espace de travail > Afficher les commandes).
2. Mettre à jour la version à la version souhaitée : (par exemple `"Version" : "v2.13.0",`)
3. Mettre en file d'attente la configuration mise à jour dans la file d'attente : `resource-run-request`
4. Surveiller le pipeline des versions de l'OAD poc-fsdh-rp
