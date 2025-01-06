# Git/GitHub Integration with Databricks

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

Navigate to your Settings from the top right drop down.

![image](/api/docs/UserGuide/Databricks/git-settings.png)

Select Linked Accounts in the left-hand sidebar.

![image](/api/docs/UserGuide/Databricks/git-linked-accounts.png)

Select your preferred Git provider and follow the prompts to link your account. Typically, you will need to provide your username and a token generated from your Git provider.

For GitHub, the access tokens can be created in Settings / Personal Access Token / Tokens (classic). On this page, click "Generate new token" then "Generate new token (classic)".
![image](https://user-images.githubusercontent.com/3179656/236484380-d193ae59-1a9c-434e-a7ec-790d691c1a89.png)

As a security best practice, we do recommend configuring an expiration date of less than a year. Tokens can easily be regenerated following expiration by following these steps.

The scopes required are `repo` and `workflow` (optional for GitHub Actions workflows)
![image](/api/docs/UserGuide/Databricks/TokenScopes.png)

If the token and access permissions are correctly configured - you should see a green mark in the settings page
![image](/api/docs/UserGuide/Databricks/git-status.png)

## Part 2: Accessing and Modifying Repositories

To clone a repository, you will need its HTTPS access link, and its branch. In your workspace, click "Create" and then "Git folder" in the dropdown menu.
![image](/api/docs/UserGuide/Databricks/git-clone-repo.png)

Input the Git repository URL and then click Create Git folder.
![image](/api/docs/UserGuide/Databricks/git-menu.png)

Once this is configured, you can see the folder in your workspace and navigate into it.

Changes done from Databricks can be pushed to the repository using the built-in Git menu. Access it by right clicking in your repo files and clicking "Git...".
![image](/api/docs/UserGuide/Databricks/git-menu-2.png)

This screen will allow you to commit and push changes, as well as pull existing changes.
![image](/api/docs/UserGuide/Databricks/git-menu-3.png)

## Resolving Conflicts

If multiple commits impact the same code, there could be a conflict issue. The following message will appear while attempting to pull code:

![image](/api/docs/UserGuide/Databricks/MergeConflict.png)

Select "Resolve conflict using PR", which opens the following:

![image](/api/docs/UserGuide/Databricks/MergeConflict2.png)

This step will ask you to create a new branch where your changes will be committed. Enter a branch name and a commit message then commit the messages again. If successful, you'll see the following message. You can follow the link in that message to make your changes.

![image](/api/docs/UserGuide/Databricks/MergeConflict3.png)

<!-- ## Automating Git pulls

?? -->
