---
remarks: Translation reviewed by DataHub team
source: /DeveloperGuide/Change-Management/Change-Management-Overview.md
draft: true
---

# Processus de gestion du changement pour Datahub

## Cas d'utilisation 1 : Hot fixes / Patches

### Type de modifications pour le cas d'utilisation 1

- Correction/mise à jour des données de la base de données
- Mises à jour mineures de l'interface utilisateur
- Mises à jour mineures de Terraform
- Pages d'administration

### Gestion des branches Git

- Branche de production
- Les commits sont ramenés dans la branche de développement
### 1. Enregistrement et planification

- Étiquette du correctif
- Rédiger des versions préliminaires dans Github pour suivre les modifications apportées (seuls les propriétaires peuvent les voir).
- La RP doit passer le cap de la construction

### 2. Approbation

- Approbation de la RP
- Approbation du pipeline de libération

### 3. Communication

- N/A - le processus de déploiement prend moins de 10 minutes
- Visible dans les notes de mise à jour

### 4. Déploiement

- Le déploiement est idéalement effectué après 17 heures dans la zone Pacifique (20 heures dans la zone Est).
- Impact mineur attendu pour les utilisateurs

### 5. Révision

Tests d'atterrissage à effectuer pour les caractéristiques clés :
- [ ] Explorateur de fichiers
- [ ] Accès aux bases de données

## Cas d'utilisation 2 : Versions mineures et majeures

### Type de modifications pour le cas d'utilisation 2

- Mise à jour du schéma de la base de données
- Nouvelle page publique
- Mises à jour majeures de l'interface utilisateur
- Mises à jour majeures de Terraform

### Gestion des branches Git

- Les mises à jour sont effectuées sur la branche Develop
- Le développement est intégré à la production par le biais de la RP

### 1. Enregistrement et planification

- Calendrier planifié à l'avance sur la base des sprints
- Changements clés (corrections de bogues, fonctionnalités) suivis dans les jalons Github
- Dates repères sur Github

### 2. Approbation

- Approbation de la RP
- Approbation du pipeline de libération
- Approbation de la direction

### 3. Communication

- L'indisponibilité du portail sera annoncée lors des heures de bureau.
- Page de maintenance disponible lorsqu'une nouvelle version est en cours de déploiement
- Bannière à examiner ultérieurement

### 4. Déploiement

- Page de maintenance
- L'accès hors ligne aux banques de données doit être envisagé ultérieurement à partir de la page de maintenance
- 2 à 12 heures de temps d'arrêt
- Du lundi au jeudi

### 5. Révision

Tests d'atterrissage à effectuer pour les caractéristiques clés :
- [ ] Explorateur de fichiers
- [ ] Accès aux bases de données
- [ ] Nouvelles zones touchées
- Ressources
- Gestion des utilisateurs

