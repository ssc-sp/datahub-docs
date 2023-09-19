# Develop, Build and deploy your web applications

## Objectives

- Host web application
- Host database
- Custom search/science database application

## Architecture

### GitHub
- **Code:** Python, Djando web framework, Django ORM. Node.js app would be very similar
- **Container repository:** Public container repository on GitHub. GitHub can provide private repositories.
- **Actions:** Package application and deploy it in Github Packages (Container Registry). Once there can be deployed on any system that supports Docker Compose.

### PostgresSQL
- Standard database, supports geospatial extensions
- Could be either SQL Server or MariaDB
- SQLlite would be recommended when recommended because of performance and costs for small/medium datasets

### Django
- Python framework for development of web applications.
- Built-in tools and components for tasks like database management and URL routing.
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
    - Docker desktop application - has possible license limitation
    - WSL - a bit more to learn
    - Create a virtual machine (HyperV or VirtualBox)
- Deployment option needs to be discussed with Department Desktop Team. 
- Memory statistics???
    - Very small overhead for Docker

### Updating/Testing the application locally:

1. Install Docker to your preferred environment. Docker Compose is included for Windows/Mac, but must be installed manually using `pip install docker-compose` on Linux.
    * You can confirm the installation using `docker run hello-world` to pull a sample image.
2. To use Django, there are a few key commands:
    * Create a project: `django-admin startproject django_project`
    * Create migrations: `python manage.py makemigrations` (Must be done after model changes)
    * Migrate: `python manage.py migrate` (Must be done after model changes)
    * Run server: `python manage.py runserver`
        * Allows you to visit the website locally at `http://127.0.0.1:8000/`
3. You should run `pip freeze > requirements.txt` after setting this up. This file allows Docker to install and use your Python packages.
4. Create a `Dockerfile`, you can use the demo file on [datahub-demos](https://github.com/ssc-sp/datahub-demos/blob/main/docker/django-app/Dockerfile) as a starting point.
    * This file installs Python, your requirements, and sets your Django page as the working directory.
5. Create a `docker-compose.yml` file, you can use the demo file on [datahub-demos](https://github.com/ssc-sp/datahub-demos/blob/main/docker/django-app/docker-compose.yml) as a starting point.
    * This file starts the web and database services for your project.
    * **Note:** If you use the sample file, you must update `django_project/settings.py` to use PostgreSQL instead of SQLite.
6. You can now use `docker-compose up` to start the Docker container. If successful, you can visit it at `http://127.0.0.1:8000/`.
    * You can also use `docker-compose up -d --build` to run in detached mode, which means you can make changes without constantly starting/stopping the container.
    * You can use `docker-compose down` to stop the container.
    * When running this container, use `docker-compose exec web python manage.py ...` to run the `migrate` or `makemigrations` scripts.

## Deploying the application in the cloud

- GitHub actions
    - When repository is changed, docker image will be built and deployed
    - FSDH Sample Github Actions workflow is available: https://github.com/ssc-sp/datahub-demos/blob/main/.github/workflows/azure-container-webapp.yml
    - Show how you can clone the repo and configure the action in your own
    - Validating the build

## Accessing the application in DataHub

- Application will be deployed in Azure behind a proxy
- Link will be accessible in DataHub workspace
- DataHub team to setup backend deployment in Azure Devops to automate deployment from Github to Azure

- Cost in Datahub
    - Plan limited to 7-8 Gb of RAM, 4 CPU cores
    - Horizontal scaling not available
    - All Docker containers will share resources
    - Basic B3 Plan
    - ~ CAD$66/month
