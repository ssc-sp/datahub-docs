---
remarks: Automatically translated with DeepL
source: /AdminGuide/unlock-users-pim.md
draft: true
---

# Déverrouiller les utilisateurs dans Azure Active Directory pour l'unité administrative Datahub (AU)

Les comptes d'utilisateurs peuvent être désactivés de temps à autre pour cause d'inactivité. Cette procédure explique comment les déverrouiller manuellement à l'aide de PIM (Privileged Identity Management).

## Prérequis

Les rôles suivants doivent être attribués à votre compte :
- Administrateur des utilisateurs de l'UA
- Lecteur de répertoire pour AAD

## Activer le PIM

1. Connectez-vous à Azure Portal (https://portal.azure.com) et passez au bon locataire ;
2. Recherchez "Privileged Identity Management" et lancez "Activate just in time" ;
3. Cliquez sur le lien "Activer" et indiquez le délai (généralement 1 heure). Attendez que votre MIP soit activé ;

## Réactiver les utilisateurs
4. Depuis Azure Portal, allez dans "Administrative units" -> Azure Datahub
5. Allez dans Utilisateurs et appliquez le filtre "Compte activé == Non"
6. Réactiver tous les utilisateurs

