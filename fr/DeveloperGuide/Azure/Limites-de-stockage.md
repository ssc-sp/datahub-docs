---
remarks: Automatically translated with DeepL
source: \$1
---

# Aperçu des alertes de stockage

## Sécurité intégrée avec une utilisation de 110 % ou un budget de 110 %.

Les groupes d'action Azure seront utilisés pour verrouiller ou désactiver le compte. Tirez parti du système d'alerte.

Actions possibles :
- Désactiver le compte de stockage ( ? supprimer/rotation des clés ?)
- Supprimer des utilisateurs de l'ACL ?
- Faire en sorte que le compte soit en lecture seule (ce qui pourrait encore provoquer une sortie).

Failsafe peut être implémenté dans Terraform Voir [Azure Metric Alert] (https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert)

## Système d'alerte pour les utilisateurs

Des avertissements par courriel seront envoyés aux utilisateurs aux seuils suivants :

- 50% d'utilisation
- 80% d'utilisation
- 90% d'utilisation

Une fonction distincte, _storage monitor_, sera déclenchée quotidiennement et exploitera l'authentification du principal du service existant auprès de l'API Azure pour capturer la capacité de stockage globale de chaque compte de stockage.

Le résultat sera stocké dans la base de données du portail dans la table azure_storage_capacity.

## Notifications par e-mail

Une troisième fonction _le processeur de courrier électronique_ exploitera les files d'attente et enverra des courriers électroniques aux utilisateurs.

