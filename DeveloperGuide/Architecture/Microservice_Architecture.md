# Current State Overview

```mermaid
flowchart LR
    B[Blazor]
    N[Notification Service]
    E[Email Service]
    I[Identity Service]
    U[User Service]
    P[Project Service]
    C[Costing Service]
    Re[Reporting Service]
    R[Resource Provisioner]
    M{{Message Queues}}


    B <--> |OAuth| I
    B <--> |Service| U
    B <--> |Service| P
    B <--> |Service| N
    B <--> |Service| C
    B <--> |Service| Re

    B --> M

    R <--> M
    E <--> M

    subgraph Datahub Portal
        B
        I
        U
        P
        N
        C
        Re

        end

    R

```

# Target State Overview

```mermaid
flowchart LR
    B[Blazor]
    N[Notification Service]
    E[Email Service]
    I[Identity Service]
    U[User Service]
    P[Project Service]
    R[Resource Provisioner]
    C[Costing Service]
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

    subgraph Datahub Portal
            B
        end

    subgraph Datahub Services
        M
        subgraph Microservices
            U
            P
            R
            N
            C
            E
        end
    end

```
