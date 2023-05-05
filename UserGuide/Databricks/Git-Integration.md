# Git/GitHub Integration with Databricks

## Pre-requisites

- Familiarity with Git version control
- Have access to a Git repository - the creation and access to a repository is outside the scope of this

## Why use Git/GitHub

- Better version control than built-in change tracker
- Manage code and notebooks outside Databricks
- Collaboration across multiple workspaces

## Workbook vs Repository

- Once you connect Git to Databricks, your git repository will contain your workbook files
- Workbook files in Git have a slightly different syntax than standard Jupyter Notebooks

## Part 1: Setup Git/GitHub with Databricks

![image](https://user-images.githubusercontent.com/3179656/236484074-eb2b631a-b130-4eda-8554-26a79bf8bb9d.png)

- Select Git provider
- Configure username
- Generate a Token to give Databricks access to your repository

For GitHub, the access tokens can be created in Settings Section / Personal Access Token / Tokens (classic)
![image](https://user-images.githubusercontent.com/3179656/236484380-d193ae59-1a9c-434e-a7ec-790d691c1a89.png)

As a security best practice, we do recommend configuring an expiration date of less than a year.

The scopes required are `repo` and `workflow` (optional for github action workflows)

If the token and access permissions are correctly configured - you should see a green mark in the settings page

![image](https://user-images.githubusercontent.com/3179656/236485049-c9a97fd0-3737-4c7d-9f3d-58242a32363c.png)

## Part 2: Accessing and Modifying Repositories

To clone a repository, you will need its HTTPS access link, and its branch.

![image](https://user-images.githubusercontent.com/3179656/236485166-3ed15a99-2ad6-4a97-9d17-8f46bbf1c111.png)

Once this is configured, you can see the files inside the repository
![image](https://user-images.githubusercontent.com/3179656/236485460-ad76f29a-f009-41e8-8bc3-2532bdfb16a1.png)

Changes done from Databricks can be pushed to the repository using the built-in 

## Resolving Conflicts

??

## Automating Git pulls

??
