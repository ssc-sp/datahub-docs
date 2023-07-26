# Onboarding

## Questions

### Registration

- [Text Input] Email address
- [Text Area] (Optional) How did you hear about FSDH and what are you hoping to achieve with it?

### Workspace

> Note: A user can only be the Workspace Lead for up to 3 workspaces.

- [Text Input] Workspace name
- [Text Input] Workspace acronym
- [Multi Select] Which features are of interest to you? (Select all that apply)
  - [x] Storage
  - [ ] Analytics
  - [x] Collaboration
  - [ ] Other

## Registration workflow
```mermaid
flowchart TD
    A[User opens FSDH registration page]
    B[User enters valid GoC email address]
    C[User optionally answers how they heard about FSDH and what they hope to achieve with it]
    D[User clicks Register]
    E[User is redirected to login page - see below]
    F[User receives welcome email]
    A ---> B
    B ---> C
    C ---> D
    D ---> E    
    E ---> F
```

## Login
```mermaid
flowchart TD 
    A[User opens FSDH Login page]
    C[Microsoft MFA Setup]
    D[Select Language]
    E[User agrees to T&C]
    F[User arrives on DataHub homepage]
    A --->|First login| C
    A --->|Subsequent logins|F
    C ---> D
    D ---> E
    E ---> F

```

## Create workspace

```mermaid
flowchart TD
    A[User clicks Create Workspace]
    B[User enters Name, Acronym, and optionally interested features]
    C[User is redirected to workspace]
    D[User completes metadata]
    F[User requests Storage and Databricks]
    G[User adds collaborators]
    A ---> |If below max number of workspaces|B
    B ---> C
    C ---> D
    C ---> G
    D ---> F
```

## Invite workflow
```mermaid
flowchart TD
    A[Lead opens manage users]
    B[Lead enters GC emails in invitation window]
    C[Lead selects roles for new collaborators]
    D[Lead clicks save changes]
    E[Collaborators received welcome email]
    F[Collaborators can login and view workspace]
    A ---> B
    B ---> C
    C ---> D
    D ---> E
    E ---> F
```