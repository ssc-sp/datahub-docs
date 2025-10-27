# OIDC Flow with Provider Selection

This document illustrates the authentication flows where a user can select between GCCF and Azure Entra as their identity provider.

## GCCF Authentication Flow (as Consolidator)

This diagram shows the flow when FSDH Portal uses GCCF as a consolidator, which in turn federates with other identity providers (e.g., a departmental Azure AD).

```mermaid
sequenceDiagram
    actor User as External User
    participant FSDH as FSDH .Net Portal (Relying Party)
    User->>FSDH: Visits login page
    FSDH-->>User: Shows login page with provider choice
    User->>FSDH: Selects GCCF
    FSDH->>GCCF: Redirects user for authentication (OIDC Auth Request)
    
    GCCF-->>User: Presents choice of IdPs
    User->>GCCF: Selects GCCF
    GCCF->>GcKey: Redirects user for authentication
    
    User->>GcKey: Authenticates
    GcKey-->>GCCF: Returns authorization code/token
    GCCF->>GcKey: Validates code/token
    
    GCCF-->>FSDH: Returns authorization code
    FSDH->>GCCF: Exchanges authorization code for tokens
    GCCF-->>FSDH: Returns Access Token and ID Token (JWT)
    Note over FSDH: Validates JWT signature and claims
    FSDH-->>User: Logs in user and request FSDH workspace access code
    User-->>FSDH: User enters FSDH access code
    FSDH-->>User: Display FSDH landing and list of invited workspaces
```

## Azure Entra Authentication Flow

This diagram shows the direct authentication flow for guest users via Azure Entra.

```mermaid
sequenceDiagram
    actor User as GoC User
    participant FSDH as FSDH Portal (Relying Party)
    participant AzureEntra as Azure Entra

    User->>FSDH: Visits login page
    FSDH-->>User: Shows login page with provider choice
    User->>FSDH: Selects Azure Entra (GoC email)
    FSDH->>AzureEntra: Redirects user for authentication (OIDC Auth Request)
    User->>AzureEntra: Authenticates
    AzureEntra-->>FSDH: Returns authorization code
    FSDH->>AzureEntra: Exchanges authorization code for tokens
    AzureEntra-->>FSDH: Returns Access Token and ID Token (JWT)
    Note over FSDH: Validates JWT signature and claims
    FSDH-->>User: Logs in user and shows land with workspaces
```

## FSDH Logout Flow

This diagram shows the front channel sign out flow with the relying party and GCCF as OpenID provider.

```mermaid
sequenceDiagram
    actor User as External User
    participant FSDH as FSDH .Net Portal (Relying Party)

    User->>FSDH: Initiates logout
    FSDH->>FSDH: Clears local application session
    FSDH->>GCCF: Redirects user to end_session_endpoint with id_token_hint and post_logout_redirect_uri
    GCCF->>GCCF: Validates request and clears its own session
    GCCF-->>User: Optionally displays a logout confirmation page
    GCCF->>FSDH: Redirects user back to the post_logout_redirect_uri
    FSDH-->>User: Displays a "You are logged out" page
```


