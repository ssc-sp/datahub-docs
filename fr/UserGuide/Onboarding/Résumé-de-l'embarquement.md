---
remarks: Automatically translated with DeepL
source: /UserGuide/Onboarding/OnboardingSummary.md
draft: true
---

# Onboarding

## Flux d'enregistrement
``mermaid``
organigramme TD
    A [L'utilisateur ouvre la page d'enregistrement de la DHSF].
    B [L'utilisateur entre une adresse e-mail valide du GdC]
    C [L'utilisateur sélectionne l'agence départementale]
    D [Enregistrement des clics utilisateur]
    E [L'utilisateur est redirigé vers la page de connexion - voir ci-dessous].
    F [L'utilisateur reçoit un e-mail de bienvenue]
    A ---> B
    B ---> C
    C ---> D
    D ---> E
    E ---> F
```

## Connexion
``mermaid``
organigramme TD
    A [L'utilisateur ouvre la page de connexion DHSF].
    B [Première connexion]
    C [Configuration de Microsoft MFA]
    D [Sélectionner la langue]
    E [L'utilisateur accepte les T&C]
    F [L'utilisateur arrive sur la page d'accueil de DataHub]
    A ---> B
    B ---> C
    A ---> F
    C ---> D
    D ---> E
    E ---> F

```

## Créer un espace de travail

``mermaid``
organigramme TD
    A [L'utilisateur clique sur Créer un espace de travail]
    B [L'utilisateur entre le nom et l'acronyme]
    C [L'utilisateur est redirigé vers l'espace de travail].
    D [L'utilisateur complète les métadonnées]
    E[L'administrateur de DataHub approuve l'espace de travail]
    F[Demandes des utilisateurs Stockage et Databricks]
    G[L'utilisateur ajoute des collaborateurs]
    A ---> B
    B ---> C
    C ---> D
    C ---> E
    C ---> G
    D ---> F
    E ---> F
```

## Inviter le flux de travail
``mermaid``
organigramme TD
    A [Le chef ouvre la gestion des utilisateurs]
    B [Le responsable entre une adresse e-mail valide du GdC]
    C [Le responsable choisit l'agence départementale]
    D [Le chef de file clique sur envoyer l'invitation]
    E [Le collaborateur a reçu un courriel de bienvenue]
    F [Le collaborateur peut se connecter et voir l'espace de travail].
    A ---> B
    B ---> C
    C ---> D
    D ---> E
    E ---> F
```

### Flux de travail d'approbation de l'administrateur de Datahub

``mermaid``
organigramme TD
    A [L'administrateur de DataHub ouvre une Pull Request sur Azure Devops].
    B[L'administrateur du DataHub compare l'e-mail de la demande de RP avec les candidats approuvés].
    C [L'utilisateur est dans la liste]
    D [L'administrateur de DataHub approuve le PR]
    E[L'administrateur de DataHub contacte les utilisateurs pour obtenir des précisions].
    A ---> B
    B ---> C
    C ---> D
    C ---> E
```
