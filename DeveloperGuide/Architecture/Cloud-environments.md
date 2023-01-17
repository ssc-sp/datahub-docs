# Recommended Cloud Environments

To facilitate the lifecycle of a project, the DataHub solution can be deployed to multiple environments for a given implementation. The following table shows an example of various environments.

| Name |  ID | Purpose | Always On | CI/CD | Functional Testing | Automated Testing | Performance Testing |
| ---- | :-: | ------- | :-------: | :---: | :----------------: | :---------------: | :-----------------: |
| Development | dev | For dev team | x | x || x | |
| Engineering | eng | For infrastructure and security development and testing | | | | | |
| Integration | int | For Integration testing | x| x| x|x | | 
| Training | trn | User training | | | | | | 
| Pre-prod | prp | Pre-production and production issue fix | | | | | x | 
| Production | prd | Live environment | x | | | | |  

 

 

 

 

