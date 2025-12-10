# ExternalUser Table Schema and Design Rationale

## Overview

The `ExternalUser` entity represents external (non-portal) users who are linked to portal users within the Datahub system. This table tracks identity information, login activity, deactivation status, and relationships to portal users and invitation requests.

## Column Specifications

| Column Name          | Data Type       | Internal | Unique | Nullable | Required | Primary Key | Purpose                                         | Design Rationale                                                                                                                                                                                                                           |
| -------------------- | --------------- | -------- | ------ | -------- | -------- | ----------- | ----------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `Id`                 | int             | Yes      | Yes    | No       | Yes      | ✓          | Unique identifier for the external user record  | Standard primary key for entity identification and database relationships                                                                                                                                                                  |
| `OID`                | string          | No       | Yes    | No       | Yes      |             | GCCF object identifier for external identity    | Required field that uniquely identifies the user in the Government of Canada Cloud Federation. Blank OID indicates incomplete invitation flow or deactivation. This is the primary identity attribute for authentication and authorization |
| `FirstLogin_DT`      | DateTimeOffset? | No       | No     | Yes      | Yes      |             | Timestamp of first login                        | Nullable field to track user activation. Allows identifying when a user first engaged with the portal. Useful for onboarding analytics and user lifecycle management. Null until user completes first login                                |
| `Signup_Email`       | string          | No       | No     | No       | Yes      |             | Email used to invite the user | This value is for auditing purposes in case the user changes their email address. The main email address is in `PortalUser`                                                                                                                                                                                                                                           |
| `LastLogin_DT`       | DateTimeOffset? | No       | No     | Yes      | Yes      |             | Timestamp of most recent login                  | Nullable field to track user activity. Enables user inactivity detection, dormant account identification, and engagement metrics. Updated on each login event                                                                              |
| `DeactivatedDate_DT` | DateTimeOffset? | No       | No     | Yes      | No       |             | Timestamp when external user was deactivated    | Nullable field to track deactivation events. Enables soft-deletion approach and audit trail for access revocation. Null indicates active user status                                                                                       |
| `DeactivatedByUser`  | PortalUser?     | No       | No     | Yes      | No       |             | Navigation property to deactivating portal user | Nullable navigation property that references the `PortalUser` who performed the deactivation. Enables audit logging and accountability. Supports identifying who initiated access revocation                                               |

**Internal** indicates if a column is only visible to the application and not exposed to the user or the admins. Internal columns are never used in URLs or APIs and only required for relational queries.

## Design Patterns

### Nullable DateTimeOffset Fields

All temporal tracking fields (`FirstLogin_DT`, `LastLogin_DT`, `DeactivatedDate_DT`) are nullable (`DateTimeOffset?`) to represent:

- **Not yet occurred**: Null indicates the event hasn't happened
- **Soft deletion**: `DeactivatedDate_DT` being non-null indicates a deactivated user without hard deletion
- **User lifecycle states**: Allows tracking complete user journey from invitation through activation to deactivation

### Identity Design

- **OID as primary identity**: The GCCF Object ID is the authoritative external identity
- **Blank OID strategy**: Indicates incomplete invitation or deactivated state without removing the record
- **External-to-Portal association table**: Relationship to a `PortalUser` is recorded in `ExternalUserPortalLink`, keeping the `ExternalUser` entity free of direct foreign keys and preserving reassociation history

### Audit Trail

- **DeactivatedByUser**: Establishes accountability by tracking which portal user initiated deactivation

### Relationship Management

- **Portal user linkage via association table**: Each external user is associated to a portal user through `ExternalUserPortalLink`, allowing reassignment while retaining audit history
- **One-to-Many with ExternalUserInvite**: Tracks all invitation attempts and resends for the user
- **Collection initialization**: `Invitations` collection is initialized with empty list to prevent null reference exceptions

## Usage Scenarios

1. **User Authentication**: Validate login using OID and track `LastLogin_DT`
2. **User Activation**: Set `FirstLogin_DT` on first successful login
3. **Inactivity Detection**: Query `LastLogin_DT` to identify dormant accounts
4. **Access Revocation**: Set `DeactivatedDate_DT` and reference `DeactivatedByUser` for audit
5. **Invitation Management**: Query `Invitations` collection for resend or history
6. **Portal User Association**: Use `PortalUser` navigation for permission context and metadata
