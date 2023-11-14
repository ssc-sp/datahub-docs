---
remarks: Automatically translated with DeepL
source: /DeveloperGuide/Change-Management/Hotfix.md
draft: true
---

# Déploiement des correctifs dans l'environnement VdP

## Qu'est-ce qu'un correctif ?

Les correctifs sont appliqués à l'environnement VdP pour résoudre un problème :

- Immédiatement
- Sans créer de temps d'arrêt ou de panne du système.
Les hotfixes sont également connus sous le nom de mises à jour QFE, abréviation de quick-fix engineering updates (mises à jour techniques rapides).

Normalement, les hotfixes sont créés comme une mesure d'urgence contre les problèmes qui doivent être corrigés immédiatement et en dehors de votre flux de développement normal.

Les correctifs traitent des problèmes spécifiques tels que

- Ajout d'une nouvelle fonctionnalité, d'un bogue ou d'un correctif de sécurité
- Correction des données ou des traductions

## Processus Git

- checkout `proof-of-concept` et créer une nouvelle branche `hotfix/<nom>` pour les changements
- valider le correctif localement dans `hotfix/<nom>`
- créer une pull request de `hotfix/<nom>` vers `preuve-de-concept`

## Déploiement du code de la branche `proof-of-concept` dans INT

- Le pipeline est similaire à l'environnement de développement
- Les modifications de la branche `proof-of-concept` déclencheront une construction dans le pipeline DevOps.

![Devops Pipeline](image.png)

- Les constructions réussies déploieront une construction réussie du pipeline dans l'environnement VdP.

![Déploiement](image-1.png)

## Passer de INT à POC

- Les modifications doivent être validées et les tests de régression doivent être effectués dans INT.
- Une fois les tests de régression terminés, les approbateurs Devops doivent être informés.
- Les approbateurs approuveront le pipeline Devops, ce qui déclenchera le déploiement du code de la "preuve de concept" dans l'environnement VdP.
