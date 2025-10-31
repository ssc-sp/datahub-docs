# OIDC Flow with Provider Selection

This document illustrates the authentication flows where a user can select between GCCF and Azure Entra as their identity provider.

## GCCF Authentication Flow

This diagram shows the flow when an external user uses GCCF to log in into FSDH after the invitation and onboarding processes have been completed.

```mermaid
sequenceDiagram
    actor User as External User
    participant FSDH as FSDH Portal (Relying Party)
    autonumber
    User->>FSDH: Visits login page
    FSDH-->>User: Shows login page with provider choice
    User->>FSDH: Selects GCCF
    FSDH-->>User: User is redirected to GCCF
    User->>GCCF: User authenticates with GCCF
    GCCF-->>User: Redirect user to FSDH with authorization code and state
    User->>FSDH: Send authorization code and state
    FSDH-->>FSDH: Process State
    FSDH->>GCCF: Exchanges authorization code for tokens
    GCCF-->>FSDH: Returns Access Token and ID Token (JWT)
    FSDH-->>FSDH: Validates JWT signature and claims
    FSDH-->>FSDH: Logs in user and load profile using sub claim
    FSDH-->>User: Display FSDH landing and list of invited workspaces
```

- Steps 1-3: The user starts at the FSDH Portal, sees provider choices, and selects GCCF.
- Steps 4-5: The portal redirects the user to GCCF to handle authentication.
- Steps 6-11: Standard OIDC workflow between GCCF and FSDH portal
- Step 12: Portal logs the user using the `sub` claim from GCCF
- Step 13: The portal displays the landing page with invited workspaces.

## Azure Entra Authentication Flow

This diagram shows the direct authentication flow for guest users via Azure Entra.

```mermaid
sequenceDiagram
    actor User as GoC User
    participant FSDH as FSDH Portal (Relying Party)
    participant AzureEntra as Azure Entra

    autonumber
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

- Steps 1-3: The user starts at the FSDH Portal, sees provider choices, and selects Azure Entra.
- Steps 4-6: The portal redirects to Azure Entra, the user authenticates, and an authorization code is returned.
- Steps 7-8: The FSDH Portal exchanges the code for an Access Token and an ID Token.
- Step 9: The portal shows the landing page with workspaces.

## FSDH Logout Flow

This diagram shows the front channel sign out flow with the relying party and GCCF as OpenID provider.

```mermaid
sequenceDiagram
    actor User as External User
    participant FSDH as FSDH Portal (Relying Party)

    autonumber
    User->>FSDH: Initiates logout
    FSDH-->>User: Redirects user to end_session_endpoint with id_token_hint and post_logout_redirect_uri
    User->>GCCF: Open end_session_endpoint with a logout request with id_token_hint
    GCCF->>GCCF: Validate the Token
    GCCF->>FSDH: GCCF sends logout request
    FSDH->>FSDH: Process logout request
    GCCF-->>User: Redirects user back to the post_logout_redirect_uri
    User->>FSDH: User opens post_logout_redirect_uri
    FSDH-->>User: Displays a "You are logged out" page
```

- Step 1: The user clicks the logout button in the FSDH Portal.
- Steps 2-3: The portal redirects the user to the `end_session_endpoint` at GCCF, including an `id_token_hint` to identify the user's session.
- Steps 4-5: GCCF validates the token, requests logout, and sends a logout request to the relying party.
- Step 6: The portal initiates local session cookies and data cleanup.
- Step 7-8: GCCF redirects the user back to the `post_logout_redirect_uri` specified by the FSDH Portal.
- Step : The user sees a page confirming they have been successfully logged out.

## User Invitation Flow

This diagram illustrates how an existing user can invite an external user to the FSDH Portal.

```mermaid
sequenceDiagram
    actor User as FSDH Workspace Owner
    participant FSDH as FSDH
    participant Email as GC Notify

    autonumber
    User->>FSDH: Navigates to 'Invite External User' page
    User->>FSDH: Enters external user's email and selects 'Invite'
    FSDH->>FSDH: Generates a unique invitation token
    FSDH->>FSDH: Generates an invitation code
    FSDH->>FSDH: Stores invitation token and code with user's email
    FSDH->>Email: Sends an invitation email to the external user
    Email-->>User: External user receives email with invitation link
```

- Step 1: A new page in the portal lets workspace owners invite external users
- Step 2: The workspace owner enters the external user's email and selects Invite;
- Steps 3-4: The portal generates a unique, single-use invitation token and is stored with the invitee's details
- Steps 5-6: The system sends an invitation email through GC Notify; the external user receives it with the link.

## External User Onboarding Flow

This diagram shows how an external user signs in for the first time using the invitation link and associates their email with the anonymous GCCF identity.

```mermaid
sequenceDiagram
    actor User as External User
    participant FSDH as FSDH Portal
    participant GCCF as GCCF

    autonumber
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

- Step 1: The external user clicks the invitation link from their email.
- Steps 2-3: The FSDH Portal verifies the invitation token; if valid, processing continues.
- Steps 4-5: The portal shows GCCF login and the user authenticates (anonymous GCCF identity).
- Steps 6-8: GCCF returns an authorization code; the portal exchanges it and receives tokens including the anonymous user ID.
- Step 9: The portal associates the anonymous GCCF user ID (`sub`) with the invitation token and user email; the backend creates a linked user profile.
- Step 10: The user is logged in and sees the invitation processed page.

## Expired Invitation Flow

This diagram shows what happens when a user tries to use an expired or invalid invitation link.

```mermaid
sequenceDiagram
    actor User as External User
    participant FSDH as FSDH Portal

    autonumber
    User->>FSDH: Clicks invitation link from email
    FSDH->>FSDH: Verifies invitation token
    FSDH-->>FSDH: Token is invalid/expired
    FSDH-->>User: Displays 'Invitation Expired' page
```

- Step 1: The external user clicks an expired or invalid invitation link.
- Steps 2-3: The FSDH Portal verifies the invitation token and finds it is invalid or expired.
- Step 4: The user is shown a page indicating that the invitation has expired.
- Follow-up: The user needs to contact the workspace owner to request a new invitation

## New Data elements for external users

The following data elements are required for inviting, authenticating, onboarding, and managing access for external users in the FSDH Portal when using GCCF.

### Invitation and linking (FSDH-managed)

| Element          | Purpose / Usage                      | Notes                                         |
| ---------------- | ------------------------------------ | --------------------------------------------- |
| Invitation Token | Unique, single-use link token        | Embedded in invite URL                        |
| Invitation Code  | Short code entered in portal         | Separate from link token                      |
| Invited Email    | Email address the invitation targets | Linked to authenticated user |
| Expires At       | Invitation expiry timestamp          |                                               |
| Invited By       | Inviter (workspace owner)            | Internal identifier                           |
| Workspace        | Target workspace                     |                                               |
| Initial Role     | Role granted on acceptance           |                                               |
| Invite Status    | Invite lifecycle state               | invited / accepted / expired / revoked        |

### External user profile (stored by FSDH)

| Element                  | Purpose / Usage                | Notes                           |
| ------------------------ | ------------------------------ | ------------------------------- |
| GCCF Identity (Subject)  | Link to GCCF identity          | Persist `sub`                   |
| First Name               | Identity of the user           |                                 |
| Last Name                | Identity of the user           |                                 |
| Primary Email            | Email associated with the user |                                 |
| Status                   | Access state                   | active / disabled (with reason) |
| Preferred Language       | UX localization                | en / fr                         |
| Organization             | Context / affiliation          | Collected if available          |
| Terms of Use Version     | Track Terms of Use consent     | Enforce before access           |
| Terms of Use Accepted At | Timestamp of consent           |                                 |
| Last Login               | Last successful authentication |                                 |
| Account Expiry           | Expiration date                | 1 year + renewal option?        |
