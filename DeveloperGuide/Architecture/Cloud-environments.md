# Recommended Cloud Environments

To facilitate the lifecycle of a project, the DataHub solution can be deployed to multiple environments for a given implementation. The following table shows an example of various environments.

| Name |  ID | Branch | Purpose | Always On | CI/CD | Functional Testing | Automated Testing | Performance Testing |
| ---- | :-: | ------- | ---- | :-------: | :---: | :----------------: | :---------------: | :-----------------: |
| Development | `dev` | `develop` | For dev team | ✅ | ✅ || ✅ | |
| Engineering | `eng` | | For infrastructure and security development and testing | | | | | |
| Integration | `int` | | For Integration testing | ✅ | ✅ | ✅ | ✅ | | 
| Training | `trn` | | User training | | | | | | 
|Staging | `stg` | | Pre-production and production issue fix | | | | | ✅ | 
| Production | `prd` | | Live environment | ✅ | | | | |  

 

 

 

 

