---
remarks: Translation reviewed by DataHub team
source: /DeveloperGuide/Architecture/Cloud-environments.md
draft: true
---

# Environnements cloud recommandés

Pour faciliter le cycle de vie d'un projet, la solution DataHub peut être déployée dans plusieurs environnements pour une mise en œuvre donnée. Le tableau suivant présente un exemple de différents environnements.

| Les tests fonctionnels, les tests automatisés, les tests de performance et les tests d'url sont des éléments essentiels pour la mise en place d'un système de gestion de l'information et de la sécurité.
| ---------------- | :--- : | ------------- | ------------------------------------------------------- | :------- : | :--- : | :---------------- : | :--------------- : | :----------------- : | :------------------------------------------------------: |
| Développement | `dev` | `develop` | Pour l'équipe de développement | ✅ | ✅ | | ✅ | | https://dev.fsdh-dhsf.science.cloud-nuage.canada.ca/home |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| Pour les tests d'intégration | ✅ | ✅ | ✅ | ✅ | ✅ | https://int.fsdh-dhsf.science.cloud-nuage.canada.ca/home |
| Formation | `trn` | | Formation des utilisateurs | | | | | | | | | | | | | | | |
| | Staging | `stg` | | | Pré-production et correction des problèmes de production | | | | ✅ | | | |
| validation de principe | `poc` | | Live environment | ✅ | | | | | | https://federal-science-datahub.canada.ca/home |
