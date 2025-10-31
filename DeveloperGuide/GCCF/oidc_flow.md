# OIDC Flow with Provider Selection

This document illustrates the authentication flows where a user can select between GCCF and Azure Entra as their identity provider.

## GCCF Authentication Flow (as Consolidator)

This diagram shows the flow when FSDH Portal uses GCCF as a consolidator, which in turn federates with other identity providers (e.g., a departmental Azure AD).

```mermaid
sequenceDiagram
    actor User as External User
    participant FSDH as FSDH Portal (Relying Party)
    User->>FSDH: Visits login page
    FSDH-->>User: Shows login page with provider choice
    User->>FSDH: Selects GCCF
    FSDH->>GCCF: Redirects user for authentication (OIDC Auth Request)

    GCCF-->>FSDH: Returns authorization code
    FSDH->>GCCF: Exchanges authorization code for tokens
    GCCF-->>FSDH: Returns Access Token and ID Token (JWT)
    Note over FSDH: Validates JWT signature and claims
    FSDH-->>User: Logs in user and request FSDH workspace access code
    User-->>FSDH: User enters FSDH access code
    FSDH-->>User: Display FSDH landing and list of invited workspaces
```

- **Provider Selection**: The user starts at the FSDH Portal and chooses GCCF as their identity provider.
- **Redirection to GCCF**: The portal redirects the user to GCCF to handle the authentication process.
- **Federated Authentication**: GCCF, acting as a consolidator, federates with the user's departmental identity provider (like a departmental Azure AD) where the user authenticates.
- **Token Exchange**: After successful authentication, GCCF provides an authorization code to the FSDH Portal. The portal then exchanges this code to get an Access Token and an ID Token.
- **User Access**: The portal validates the tokens and logs the user in. The user is then prompted for an FSDH workspace access code to see their workspaces.

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

- **Provider Selection**: The user starts at the FSDH Portal and chooses Azure Entra as their identity provider.
- **Direct Authentication**: The portal redirects the user directly to Azure Entra for authentication.
- **Token Exchange**: After the user authenticates, Azure Entra provides an authorization code to the FSDH Portal. The portal exchanges this code for an Access Token and an ID Token.
- **User Access**: The portal validates the tokens and logs the user in, showing them their landing page with a list of workspaces.

## FSDH Logout Flow

This diagram shows the front channel sign out flow with the relying party and GCCF as OpenID provider.

```mermaid
sequenceDiagram
    actor User as External User
    participant FSDH as FSDH .Net Portal (Relying Party)

    User->>FSDH: Initiates logout
    FSDH->>FSDH: Clears local application session
    FSDH->>GCCF: Redirects user to end_session_endpoint with id_token_hint and post_logout_redirect_uri
    GCCF->>GCCF: Validate the Token
    GCCF->>User: Logout configuration request
    GCCF->>FSDH: GCCF sends logout request
    GCCF->>FSDH: Redirects user back to the post_logout_redirect_uri
    FSDH-->>User: Displays a "You are logged out" page    
```

- **Initiation**: The user clicks the logout button in the FSDH Portal.
- **Local Session Cleanup**: The FSDH Portal clears its own local session cookies and data.
- **Redirect to OIDC Provider**: The portal redirects the user to the `end_session_endpoint` at GCCF, including an `id_token_hint` to identify the user's session.
- **Central Logout**: GCCF validates the token, logs the user out of the central session, and handles any federated logout procedures.
- **Redirect Back to Application**: GCCF redirects the user back to the `post_logout_redirect_uri` specified by the FSDH Portal.
- **Confirmation**: The user sees a page confirming they have been successfully logged out.

## User Invitation Flow

This diagram illustrates how an existing user can invite an external user to the FSDH Portal.

```mermaid
sequenceDiagram
    actor User as FSDH Workspace Owner
    participant FSDH as FSDH
    participant Email as GC Notify

    User->>FSDH: Navigates to 'Invite External User' page
    User->>FSDH: Enters external user's email and selects 'Invite'
    FSDH->>FSDH: Generates a unique invitation token
    FSDH->>FSDH: Stores invitation token with user's email
    FSDH->>Email: Sends an invitation email to the external user
    Email-->>User: External user receives email with invitation link
```

- **Initiation**: An existing FSDH user initiates an invitation from the portal.
- **Invitation Request**: The portal's backend receives the request, including the external user's email.
- **Token Generation**: A unique, single-use invitation token is generated and stored, associated with the invitee's email.
- **Email Notification**: The system sends an email to the external user containing a link with the unique invitation token.

## External User Onboarding Flow

This diagram shows how an external user signs in for the first time using the invitation link and associates their email with the anonymous GCCF identity.

```mermaid
sequenceDiagram
    actor User as External User
    participant FSDH as FSDH Portal
    participant GCCF as GCCF

    User->>FSDH: Clicks invitation link from email
    FSDH->>FSDH: Verifies invitation token
    FSDH-->>FSDH: Token is valid
    FSDH-->>User: Shows GCCF login
    User->>GCCF: Authenticates (anonymously - GCCF)
    GCCF-->>FSDH: Returns authorization code
    FSDH->>GCCF: Exchanges authorization code for tokens
    GCCF-->>FSDH: Returns Access Token and ID Token (with anonymous user ID)
    FSDH->>FSDH: Associates anonymous GCCF user ID (sub claim) with the invitation token and user email
    FSDH-->>User: Logs in user and show invitation processed page    
```

- **Invitation Link**: The external user clicks the invitation link from their email.
- **Token Verification**: The FSDH Portal verifies the invitation token with the backend system.
- **GCCF Authentication**: The user is prompted to log in and selects GCCF, which provides an anonymous identity.
- **Token Exchange**: The portal receives an ID Token from GCCF containing an anonymous user ID (`sub` claim).
- **Email Association**: The portal sends the anonymous user ID and the user's email (retrieved from the invitation) to the backend.
- **Account Linking**: The backend system creates a user profile, associating the anonymous GCCF user ID with the user's email address.
- **Access Granted**: The user is now logged in and can access the FSDH workspace they were invited to.

## Expired Invitation Flow

This diagram shows what happens when a user tries to use an expired or invalid invitation link.

```mermaid
sequenceDiagram
    actor User as External User
    participant FSDH as FSDH Portal

    User->>FSDH: Clicks invitation link from email
    FSDH->>FSDH: Verifies invitation token
    FSDH-->>FSDH: Token is invalid/expired
    FSDH-->>User: Displays 'Invitation Expired' page
```

- **Expired Link**: The external user clicks an expired or invalid invitation link.
- **Token Verification Fails**: The FSDH Portal verifies the invitation token and finds it is invalid or expired.
- **Error Display**: The user is shown a page indicating that the invitation has expired.
- **Request New Invitation**: The user is given an option to request a new invitation.

