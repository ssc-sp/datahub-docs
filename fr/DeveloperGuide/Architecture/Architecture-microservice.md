---
remarks: Automatically translated with DeepL
source: /DeveloperGuide/Architecture/Microservice_Architecture.md
draft: true
---

# Aperçu de l'état actuel

``mermaid``
organigramme LR
    B [Blazor]
    N[Service de notification]
    E [Service e-mail]
    I [Service d'identité]
    U [Service utilisateur]
    P [Service des projets]
    C [Service d'évaluation des coûts]
    Re [Service des rapports]
    R[Fournisseur de ressources]
    M{{Questions de messages}}


    B <--> |OAuth| I
    B <--> |Service| U
    B <--> |Service| P
    B <--> |Service| N
    B <--> |Service| C
    B <--> |Service| Re

    B --> M

    R <--> M
    E <--> M

    Sous-graphe du portail Datahub
        B
        I
        U
        P
        N
        C
        Re

        fin

    R

```

# Aperçu de l'État cible

``mermaid``
organigramme LR
    B [Blazor]
    N[Service de notification]
    E [Service e-mail]
    I [Service d'identité]
    U [Service utilisateur]
    P [Service des projets]
    R[Fournisseur de ressources]
    C [Service d'évaluation des coûts]
    M{{Message Bus}}


    B <--> |OAuth| I
    B <--> |API| U
    B <--> |API| P
    B <--> |API| N
    B <--> |API| C
    B <--> |API| E
    B <--> |API| R

    B --> M

    R <--> M
    E <--> M
    P <--> M
    U <--> M
    N <--> M
    C <--> M

    Sous-graphe du portail Datahub
            B
        fin

    sous-graphe Services Datahub
        M
        sous-graphe Microservices
            U
            P
            R
            N
            C
            E
        fin
    fin

```
