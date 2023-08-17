---
remarks: Automatically translated with DeepL
source: /UserGuide/Onboarding/OnboardingSummary.md
draft: true
---

# Onboarding

## Questions

### Enregistrement

- [Saisie de texte] Adresse électronique
- (Facultatif) Comment avez-vous entendu parler de la DHSF et qu'espérez-vous obtenir grâce à elle ?

### Espace de travail

> Note : Un utilisateur ne peut être le responsable d'un espace de travail que pour un maximum de 3 espaces de travail.

- Nom de l'espace de travail
- [Saisie de texte] Acronyme de l'espace de travail
- Quelles sont les caractéristiques qui vous intéressent ? (Sélectionnez tout ce qui s'applique)
  - [x] Stockage
  - [ ] Analytique
  - [x] Collaboration
  - Autre

## Flux d'inscription
``mermaid``
organigramme TD
    A [L'utilisateur ouvre la page d'enregistrement de la DHSF].
    B [L'utilisateur entre une adresse e-mail valide du GdC]
    C[L'utilisateur répond éventuellement à la question de savoir comment il a entendu parler de la DHSF et ce qu'il espère réaliser avec elle]
    D [Enregistrement des clics utilisateur]
    E [L'utilisateur est redirigé vers la page de connexion - voir ci-dessous].
    F [L'utilisateur reçoit un e-mail de bienvenue]
    A ---> B
    B ---> C
    C ---> D
    D ---> E
    E ---> F
```

## Login Flow
``mermaid``
organigramme TD
    A [L'utilisateur ouvre la page de connexion DHSF].
    C [Configuration de Microsoft MFA]
    D [Sélectionner la langue]
    E [L'utilisateur accepte les T&C]
    F [L'utilisateur arrive sur la page d'accueil de DataHub]
    A --->|Première connexion| C
    A --->|Connexions ultérieures|F
    C ---> D
    D ---> E
    E ---> F

```

## Créer un flux d'espace de travail

``mermaid``
organigramme TD
    A [L'utilisateur clique sur Créer un espace de travail]
    B[L'utilisateur saisit le nom, l'acronyme et, éventuellement, les caractéristiques qui l'intéressent].
    C [L'utilisateur est redirigé vers l'espace de travail].
    D [L'utilisateur complète les métadonnées]
    F[Demandes des utilisateurs Stockage et Databricks]
    G[L'utilisateur ajoute des collaborateurs]
    A ---> |Si le nombre d'espaces de travail est inférieur à la limite maximale|B
    B ---> C
    C ---> D
    C ---> G
    D ---> F
```

## Invite Flow
``mermaid``
organigramme TD
    A [Le chef ouvre la gestion des utilisateurs]
    B[Le chef de file saisit les courriels du GC dans la fenêtre d'invitation].
    C[Le chef de file sélectionne les rôles des nouveaux collaborateurs].
    D[L'administrateur principal clique sur enregistrer les modifications]
    E[Les collaborateurs ont reçu un courriel de bienvenue]
    F[Les collaborateurs peuvent se connecter et voir l'espace de travail]
    A ---> B
    B ---> C
    C ---> D
    D ---> E
    E ---> F
```
