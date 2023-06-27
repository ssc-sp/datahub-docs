---
remarks: Automatically translated with DeepL
source: /AdminGuide/Managing-Budgets.md
draft: true
---

# Budgets

Les espaces de travail ont deux postes budgétaires clés :
- Budgets d'alerte et d'avertissement
- Limites du budget Azure

## Budgets d'alerte et d'avertissement

Les budgets d'alerte et d'avertissement sont stockés dans la table `Projects` dans la colonne `Project_Budget`

### Exemple de requête pour mettre à jour les budgets manquants

``sql
UPDATE [dbo].[Projets]
SET Project_Budget = 400 where Project_Budget is null
```
