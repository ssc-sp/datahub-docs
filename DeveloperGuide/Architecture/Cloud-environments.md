# Recommended Cloud Environments

To facilitate the lifecycle of a project, the DataHub solution can be deployed to multiple environments for a given implementation. The following table shows an example of various environments.

| Name | Development | Integration | Proof of Concept |
|---|---|---|---|
| ID | `dev` | `int` | `poc` |
| Branch | `develop` | `integration` |  |
| Version | 2.13 | 2.12 | 2.12 |
| Purpose | For dev team | For Integration testing | Live environment |
| Always On | ✅ | ✅ | ✅ |
| CI/CD | ✅ | ✅ |  |
| Functional Testing |  | ✅ |  |
| Automated Testing | ✅ | ✅ |  |
| Performance Testing |  |  |  |
| Url | https://dev.fsdh-dhsf.science.cloud-nuage.canada.ca/home | https://int.fsdh-dhsf.science.cloud-nuage.canada.ca/home | https://federal-science-datahub.canada.ca/home |
