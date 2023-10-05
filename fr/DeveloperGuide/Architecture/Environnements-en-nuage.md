---
remarks: Automatically translated with DeepL
source: /DeveloperGuide/Architecture/Cloud-environments.md
draft: true
---

# Environnements cloud recommandés

Pour faciliter le cycle de vie d'un projet, la solution DataHub peut être déployée dans plusieurs environnements pour une mise en œuvre donnée. Le tableau suivant présente un exemple de différents environnements.

| Nom | Développement | Intégration | Preuve de concept |
|---|---|---|---|
| ID | `dev` | `int` | `poc` |
| Branch | `develop` | | `integration` | | | |
Version 2.13 | 2.12 | 2.12 | 2.12 | 2.12 | 2.12
| Pour l'équipe de développement, pour les tests d'intégration, pour l'environnement réel, pour l'équipe de développement, pour l'équipe de développement.
| Toujours activé ✅ ✅ ✅ ✅ ✅
| ✅ | ✅ | | ✅ | ✅ | ✅
| Tests fonctionnels | | ✅ | | | Tests fonctionnels
| Tests automatisés | ✅ | ✅ | | | Tests automatisés
Test des performances | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| Url | https://dev.fsdh-dhsf.science.cloud-nuage.canada.ca/home | https://int.fsdh-dhsf.science.cloud-nuage.canada.ca/home | https://federal-science-datahub.canada.ca/home |
