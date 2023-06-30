# Git/GitHub Integration with Databricks

<video width="600" height="350" controls>
    <source src="/api/media/git-integration.mp4" type="video/mp4">
    Your browser does not support the video tag.
</video>

## Pre-requisites

- Familiarity with Git version control.
- Have access to a Git repository - the creation and access to a repository is outside the scope of this guide.

## Why use Git/GitHub

- Better version control than built-in change tracker.
- Manage code and notebooks outside Databricks.
- Collaboration across multiple workspaces.

## Workbook vs Repository

- Once you connect Git to Databricks, you can create and use notebooks like normal and also push them to GitHub.
- Workbook files in Git have a slightly different syntax than standard Jupyter Notebooks.

## Part 1: Setup Git/GitHub with Databricks

Navigate to your User Settings from the top right drop down. Select the Git integration tab.

![image](https://user-images.githubusercontent.com/3179656/236484074-eb2b631a-b130-4eda-8554-26a79bf8bb9d.png)

- Select your Git provider
- Configure username
- Generate a Token to give Databricks access to your repository

For GitHub, the access tokens can be created in Settings / Personal Access Token / Tokens (classic). On this page, click "Generate new token" then "Generate new token (classic)".
![image](https://user-images.githubusercontent.com/3179656/236484380-d193ae59-1a9c-434e-a7ec-790d691c1a89.png)

As a security best practice, we do recommend configuring an expiration date of less than a year. Tokens can easily be regenerated following expiration by following these steps.

The scopes required are `repo` and `workflow` (optional for GitHub Actions workflows)
![image](TokenScopes.png)

If the token and access permissions are correctly configured - you should see a green mark in the settings page

![image](https://user-images.githubusercontent.com/3179656/236485049-c9a97fd0-3737-4c7d-9f3d-58242a32363c.png)

## Part 2: Accessing and Modifying Repositories

To clone a repository, you will need its HTTPS access link, and its branch.

![image](https://user-images.githubusercontent.com/3179656/236485166-3ed15a99-2ad6-4a97-9d17-8f46bbf1c111.png)

Once this is configured, you can see the files inside the repository
![image](GitMenu.png)

Changes done from Databricks can be pushed to the repository using the built-in Git menu. Access it by right clicking in your repo files and clicking "Git...".

This screen will allow you to commit and push changes, as well as pull existing changes.

![image](GitMenu2.png)

## Resolving Conflicts

If multiple commits impact the same code, there could be a conflict issue. The following message will appear while attempting to pull code:

![image](MergeConflict.png)

Select "Resolve conflict using PR", which opens the following:

![image](MergeConflict2.png)

This step will ask you to create a new branch where your changes will be committed. Enter a branch name and a commit message then commit the messages again. If successful, you'll see the following message. You can follow the link in that message to make your changes.

![image](MergeConflict3.png)

<!-- ## Automating Git pulls

?? -->
