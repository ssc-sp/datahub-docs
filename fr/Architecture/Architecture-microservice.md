[_metadata_: remarks]:- "Automatically translated with DeepL. From: /Architecture/Microservice_Architecture.md"

[_(draft documentation, please review)_](/Architecture/Microservice_Architecture.md)

# Aperçu de la prochaine étape

``mermaid``
organigramme LR
    B [Blazor]
    N[Service de notification]
    I [Service d'identité]
    U [Service utilisateur]
    P [Service des projets]
    C [Service d'évaluation des coûts]
    Re [Service des rapports]
    R[Fournisseur de ressources]
    M{{Message Queue}}


    B <--> |OAuth| I
    B <--> |Service| U
    B <--> |Service| P
    B <--> |Service| N
    B <--> |Service| C
    B <--> |Service| Re

    B --> M

    R <--> M

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

    B --> M

    R <--> M
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
        fin
    fin

```
