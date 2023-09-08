# Develop, Build and deploy your web applications

## Objectives

Host web application
Host database
Custom search/science database application

## Architecture

GitHub:
- **Code:** Python, Djando web framework, Django ORM. Node.js app would be very similar
- **Container repository:** Public container repository on GitHub. GitHub can provide private repositories.
- **Actions:** Package application and deploy it in Github docker registry. Once there can be deployed on any system that supports docker compose.

PostgresSQL:
- Standard database, supports geospatial extensions
- Could be either SQL Server or MariaDB
- SQLlite would be recommended when recommended because of performance and costs for small/medium datasets

Django:
- <Sean to add more details>
- Many frameworks, web hosting + object mapper

## Docker Compose

- Package 
- Extension of docker, provides docker orchestration
- Not an alternative to Kubernetes. Many features not supported today (scaling, distributed, etc.). 
- Simple model to package systems that cannot fit in a single docker

- Not first choice
- Single docker preferred when possible
- Docker compose allows to build application with multiple images - aka multiple servers. Use template or contact Datahub

- Required background
    - Networking: all ports required need to specified
    - Storage: persistent storage needs to be managed
    - Changes on images are not persisted after restart

## Running and working locally

- Docker desktop has limitations
- Options
    - Docker desktop application - has possibly license limitation
    - WSL - a bit more to learn
    - Create virtual machine (HyperV or VirtualBox)
- Deployment option needs to be discussed with Department Desktop Team. 

Updating/Testing the application locally:
<Sean>

## Deploying the application in the cloud

- GitHub actions
    - When repository is changed, docker image will be built and deployed
    - <Simon>
    - Show how you can clone the repo and configure the action in your own
    - Validating the build

## Accessing the application in DataHub

- Application will be deployed in Azure behind a proxy
- Link will be accessible in DataHub workspace
- DataHub team to setup backend deployment in Azure Devops to automate deployment from Github to Azure