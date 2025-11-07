# External User OIDC Data Model Integration

This document proposes the data model changes required to incorporate the new external-user data elements (defined in `oidc_flow.md`) into the portal domain model

- New ExternalUser entity (invitation + profile);
- New EntraUser entity for Azure Entra–specific properties; and
- Changes to `PortalUser` so it references exactly one of {`EntraUser`, `ExternalUser`}.

## Proposed Additions Overview

| Concept                     | New / Modified                                             | Rationale                                                                                 |
| --------------------------- | ---------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| ExternalUser                | New                                                        | Single entity storing invitation + profile attributes (data elements from `oidc_flow.md`) |
| EntraUser                   | New                                                        | Stores Azure Entra–specific identity attributes (e.g., Graph GUID)                        |
| `PortalUser.ExternalUserId` | Added (FK, nullable)                                       | Link to `ExternalUser` when applicable                                                    |
| `PortalUser.EntraUserId`    | Added (FK, nullable)                                       | Link to `EntraUser` when applicable                                                       |

## Detailed Schema Proposals

### ExternalUser entity

Represents the complete lifecycle and profile of an external user, from invitation to active usage, with C# types.

| Property                | C# Type         | Constraints / Notes                                |
| ----------------------- | --------------- | -------------------------------------------------- |
| `Id`                    | int             | PK                                                 |
| `InvitationToken`       | Guid            | Unique link token ( unique)                        |
| `InvitationSentAt`      | DateTimeOffset? | Timestamp when GC Notify email is sent             |
| `InvitationExpiry`      | DateTimeOffset  | Invitation expiry                                  |
| `InvitationCode`        | string          | Short human-entered code (e.g. 2T5-T1S)            |
| `InvitedByPortalUserId` | int             | FK to `PortalUser` (inviter)                       |
| `InviteStatus`          | InviteStatus    | invited / accepted / expired / revoked             |
| `InvitationAcceptedAt`  | DateTimeOffset? | Timestamp when accepted                            |
| `ExternalSubject`       | string          | GCCF `sub` claim (unique index when populated)     |
| `PrimaryEmail`          | string          | Primary user email used for invitation and contact |
| `FirstName`             | string          | Mandatory                                          |
| `LastName`              | string          | Mandatory                                          |
| `Affiliation`           | string          | Relationship notes                                 |
| `Organization`          | string          | Optional org context                               |
| `IsActive`              | bool            | true if active                                     |
| `AccountExpiry`         | DateTimeOffset  | Future expiry/renewal                              |
| `CreatedAt`             | DateTimeOffset  | Creation timestamp                                 |
| `UpdatedAt`             | DateTimeOffset  | Update timestamp                                   |
| `UserRevokedAt`         | DateTimeOffset? | Timestamp when revoked                             |
| `DeactivationReason`    | string?         | Audit trail on disable                             |
| `PortalUserId`          | int             | Portal User ID relation                            |

Existing fields from UserSettings be used for external users:

- Language
- AcceptedDate (T&Cs)
- Theme

### EntraUser entity

Represents Azure Entra–backed identity data separated from `PortalUser`.

| Property       | C# Type        | Notes                              |
| -------------- | -------------- | ---------------------------------- |
| `Id`           | int            | Primary key (identity)             |
| `GraphGuid`    | string         | Azure AD object ID (unique index)  |
| `CreatedAt`    | DateTimeOffset | Set at insert                      |
| `UpdatedAt`    | DateTimeOffset | Updated on modification            |
| `Email`        | string         | User principal email/UPN if needed |
| `PortalUserId` | int            | Portal User ID relation            |

### PortalUser Changes

Additions:

```csharp
public class PortalUser
{
    // Provider links (exactly one must be non-null)
    public int? ExternalUserId { get; set; } // FK to ExternalUser
    public ExternalUser ExternalUser { get; set; }

    public int? EntraUserId { get; set; } // FK to EntraUser
    public EntraUser EntraUser { get; set; }

    // Convenience: computed property (option A)
    public bool IsExternal => ExternalUserId.HasValue && !EntraUserId.HasValue;

    // Optional: keep universal display fields at PortalUser (provider-agnostic)
    public string DisplayName { get; set; }
}
```

## Mapping of OIDC Flow Data Elements → Schema

| OIDC Flow Element        | Target Property          | Entity        | Notes                           |
| ------------------------ | ------------------------ | ------------- | ------------------------------- |
| Invitation Token         | `Token`                  | ExternalUser  | Provided in emailed URL         |
| Invitation Code          | `Code`                   | ExternalUser  | User-entered verification       |
| Invited Email            | `InvitedEmail`           | ExternalUser  | Primary Email                   |
| Expires At               | `InvitationExpiresAt`    | ExternalUser  | Used for onboarding gating      |
| Invited By               | `InvitedByPortalUserId`  | ExternalUser  | FK to inviter                   |
| Workspace                | `Project_ID`             | UserRoleLinks | Context for initial access      |
| Invite Status            | `InviteStatus`           | ExternalUser  | State machine transitions       |
| GCCF Identity (Subject)  | `ExternalSubject`        | ExternalUser  | Persistent link to IdP identity |
| First / Last Name        | `FirstName` / `LastName` | ExternalUser  | Optional based on data capture  |
| Affiliation              | `Affiliation`            | ExternalUser  | Relationship notes              |
| Primary Email            | `PrimaryEmail`           | ExternalUser  | Login + comms                   |
| Preferred Language       | `Language`               | UserSettings  | UX localization                 |
| Organization             | `Organization`           | ExternalUser  | Contextual                      |
| Terms of Use Accepted At | `AcceptedDate`           | UserSettings  | Compliance timestamp            |
| Last Login               | `LastLoginDateTime`      | PortalUser    | Last login timestamp            |
| Account Expiry           | `AccountExpiry`          | ExternalUser  | Lifecycle governance            |

## Edge Cases & Considerations

| Scenario                                            | Handling                                                                                                                                           |
| --------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| Invitation manually revoked                         | `InviteStatus = revoked`; link no longer valid; acceptance flow blocks.                                                                            |
| External user deactivated                           | `AccountStatus = disabled`; login flow denies access post-auth, or soft-lock workspace roles.                                                      |

## Phased Migration Plan

1. Schema Creation: Add `ExternalUsers` and `EntraUsers` tables; add nullable `ExternalUserId` / `EntraUserId` FKs to `PortalUser`.
2. Backfill Entra: Create `EntraUser` rows from existing `PortalUser.GraphGuid` + emails; set `PortalUser.EntraUserId`. Verify counts.
3. Introduce external invitation workflow (create ExternalUser on invite; link on acceptance).
4. Drop `PortalUser.GraphGuid` (make nullable, then remove) once all rows are linked to `EntraUser`.
5. Remove `PortalUser.Email` after consumers migrated to provider-specific sources.
