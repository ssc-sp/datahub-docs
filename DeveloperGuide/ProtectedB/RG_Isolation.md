
# Isolation (Resource Group vs Subscription)

This page summarizes how common assurance frameworks (ISO 27001, SOC 2, and ITSG-33) typically treat **environment isolation** when implemented on Azure.

## FSDH workspace boundary

In FSDH, a **workspace is isolated at the Azure Resource Group level**.

Subscriptions are used as **platform-level boundary** for separating environments, but they are not the unit of isolation for individual workspaces.

## Required isolation principles (ISO 27001, SOC 2, ITSG-33)

In this context (workspace boundary = **Resource Group**), the following isolation principles need to be applied:

- **Defined system boundary**: what is “in scope” for the workspace (RG resources and any explicit shared services/dependencies).
- **Least privilege and separation of duties**: access is scoped to the RG where possible; privileged subscription-wide access is minimized, controlled, and reviewed.
- **Controlled change**: changes to in-scope resources are authorized, reviewed, and traceable (prefer IaC and approved pipelines).
- **Monitoring and auditability**: activity and security-relevant telemetry is collected, retained, and reviewed so that cross-workspace impact can be detected.
- **Incident containment**: responders can isolate/contain issues within the workspace boundary, and escalation paths exist for shared/platform components.
- **Risk-based zoning (ITSG-33 emphasis)**: if multiple security zones/classifications exist, the platform must prevent lower-trust workloads from impacting higher-trust workloads (typically a subscription/platform concern rather than per-workspace).

## RG isolation governance checklist

The RG is the unit of ownership and control, and subscription-level governance is designed to control the boundary.

- **Policy guardrails**: Azure Policy assignments that prevent prohibited configurations (public endpoints, weak TLS, non-approved regions/SKUs), with clear inheritance and exception handling.
- **Least-privilege RBAC**: Role assignments scoped to RG (or below), minimal subscription-level role grants, and separation of duties for admin vs deploy vs read-only.
- **Privileged access management**: Use PIM/JIT for elevated roles; keep standing access small and reviewed.
- **Network isolation patterns**: Separate VNets/subnets per workload where appropriate, private endpoints, and controlled egress; avoid “flat” shared networks that couple unrelated workloads.
- **Centralized logging and monitoring**: Activity logs + resource logs routed to a controlled, tamper-resistant central workspace with alerting and retention.
- **Standardized change control**: Infrastructure-as-code and CI/CD with approvals; prevent ad-hoc portal changes where possible.
- **Operational ownership clarity**: Tags/metadata, budgets, and runbooks aligned to RG boundaries.

## Mitigations for RG isolation

The mitigations below are set up to make the RG boundary defensible and to keep the real-world blast radius aligned with the documented system boundary.

- **Access (RBAC and privilege management)**
  - Role assignments are scoped to the RG (or below) by default.
  - Subscription-level roles (Owner/Contributor/User Access Administrator) are minimized (cloud team only), and require PIM/JIT for any necessary elevation.
  - Managed identities are used for workloads with no long-lived credentials.

- **Change control (preventing drift and unsafe changes)**
  - IaC (Terraform) and CI/CD approvals used for changes to RG resources.
  - Azure Policy guardrails used to block prohibited configurations (e.g., disallow public endpoints where not permitted).
  - Resource locks for critical resources where appropriate.

- **Policy and configuration governance**
  - Manage Azure Policy as code, with controlled exemption workflows and regular review.
  - Ensure subscription-level policy does not unintentionally weaken RG boundaries (or document and account for inheritance explicitly).
  - Monitor policy compliance continuously.

- **Network isolation and shared service controls**
  - No “flat” shared networks across unrelated workloads; VNets/subnets segmented and egress controlled.
  - Only cloud team can modify shared network components (VNet, DNS, firewall, private endpoints) and cross-boundary dependencies are documented.
  - Private connectivity patterns are used (private endpoints, controlled peering).

Subscription-level admin access and shared services are part of the design.

Common risk drivers that can make RG-only isolation weaker:

- Broad subscription-level role assignments (Owner/Contributor) for many users or pipelines
  - **Mitigation:** subscription-level role assignments are strictly controlled and governed
- Shared network and platform components changed by multiple teams (VNets, DNS, firewalls, private endpoints)
  - **Mitigation:** shared network/platform changes are restricted (clear ownership and approvals) and dependencies are documented
- Shared operational dependencies without explicit contracts (central Key Vault, logging workspace, shared identities)
  - **Mitigation:** shared dependencies are explicitly documented (contracts/ownership) and access is tightly controlled
- Subscription-level quotas/limits that can be exhausted by one workload
  - **Mitigation:** quotas/limits are monitored and workloads are separated when one could impact others
