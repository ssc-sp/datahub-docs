# Recommended Cloud Environments

To facilitate the lifecycle of a project, the DataHub solution can be deployed to multiple environments for a given implementation. The following table shows an example of various environments.

| Name             |  ID   | Branch        | Purpose                                                 | Always On | CI/CD | Functional Testing | Automated Testing | Performance Testing |                           Url                            |
| ---------------- | :---: | ------------- | ------------------------------------------------------- | :-------: | :---: | :----------------: | :---------------: | :-----------------: | :------------------------------------------------------: |
| Development      | `dev` | `develop`     | For dev team                                            |    ✅     |  ✅   |                    |        ✅         |                     | https://dev.fsdh-dhsf.science.cloud-nuage.canada.ca/home |
| Engineering      | `eng` |               | For infrastructure and security development and testing |           |       |                    |                   |                     |                                                          |
| Integration      | `int` | `integration` | For Integration testing                                 |    ✅     |  ✅   |         ✅         |        ✅         |                     | https://int.fsdh-dhsf.science.cloud-nuage.canada.ca/home |
| Training         | `trn` |               | User training                                           |           |       |                    |                   |                     |                                                          |
| Staging          | `stg` |               | Pre-production and production issue fix                 |           |       |                    |                   |         ✅          |                                                          |
| Proof of Concept | `poc` |               | Live environment                                        |    ✅     |       |                    |                   |                     |      https://federal-science-datahub.canada.ca/home      |
