# Onboarding

## Registration workflow
```mermaid
flowchart TD
    A[User opens FSDH registration page]
    B[User enters valid GoC email address]
    C[User selects department agency]
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
    B[First time login]
    C[Microsoft MFA Setup]
    D[Select Language]
    E[User agrees to T&C]
    F[User arrives on DataHub homepage]
    A ---> B
    B ---> C
    A ---> F
    C ---> D
    D ---> E
    E ---> F

```

## Create workspace

```mermaid
flowchart TD 
    A[User clicks Create Workspace]
    B[User enters Name and Acronym]
    C[User is redirected to workspace]
    D[User completes metadata]
    E[DataHub administrator approves workspace]
    F[User requests Storage and Databricks]
    G[User adds collaborators]
    A ---> B
    B ---> C
    C ---> D
    C ---> E
    C ---> G
    D ---> F
    E ---> F
```
