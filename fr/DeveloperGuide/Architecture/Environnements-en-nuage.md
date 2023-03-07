---
remarks: Automatically translated with DeepL
source: /DeveloperGuide/Architecture/Cloud-environments.md
draft: true
---

# Environnements cloud recommandés

Pour faciliter le cycle de vie d'un projet, la solution DataHub peut être déployée dans plusieurs environnements pour une mise en œuvre donnée. Le tableau suivant présente un exemple de différents environnements.

| Nom | ID | Branche | Objectif | Always On | CI/CD | Tests fonctionnels | Tests automatisés | Tests de performance
| ---- | :- : | ------- | ---- | :------- : | :--- : | :---------------- : | :--------------- : | :----------------- : |
| Développement | `dev` | `develop` | Pour l'équipe de développement | ✅ | ✅ | | ✅ | | | | |
| Engineering | `eng` | Pour le développement et les tests de l'infrastructure et de la sécurité | | | | | | | | | | | | | | | | | |
| Intégration | `int` | | Pour les tests d'intégration | ✅ | ✅ | ✅ | ✅ | | ✅ | |
| Formation des utilisateurs | | | | | | | | | | | | | | | | | | Formation des utilisateurs
| Staging | `stg` | | Correction des problèmes de pré-production et de production | | | | | ✅ | |
| Production | `prd` | | Live environment | ✅ | | | | | | | | |









