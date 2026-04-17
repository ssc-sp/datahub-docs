# GCCF (Government of Canada Cloud Framework) Integration

This section covers the integration of FSDH with GCCF as an external identity provider, including authentication flows, workspace isolation, and local development setup.

## Overview

| File | Description |
|------|-------------|
| [AuthenticationFlows.md](./AuthenticationFlows.md) | OIDC authentication flows showing how users select between GCCF and Azure Entra ID as their identity provider, including diagrams for the full login sequence. |
| [ProtectedB.md](./ProtectedB.md) | Describes Protected B workspace isolation rules: visibility restrictions, labelling requirements, and how Protected B workspaces differ from standard workspaces. |
| [dev-auth-gccf.md](./dev-auth-gccf.md) | Guide for enabling a development authentication mode that simulates a GCCF external user login locally, exercising the same authorization path (ASP.NET Core auth, `RoleClaimTransformer`, workspace role resolution) without requiring a real GCCF connection. |

## Related Security documentation

- [Portal RBAC](../Security/RBAC/Portal.md) — Details how the authentication and roles are used in Blazor Portal
