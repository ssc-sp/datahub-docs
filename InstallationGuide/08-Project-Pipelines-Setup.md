## Azure Devops CD

This guide will walk you through the steps to setup Azure DevOps for DataHub Project infrastructure.

## Create release pipeline

You will need to create a release pipeline for the project infrastructure.

## Example release pipeline

The following is an example release pipeline for the Datahub Projects terraform pipelines. You can use this as a reference to create your own.

```yaml

#Your build pipeline references an undefined variable named ‘lsb_release -cs’. Create or edit the build pipeline for this YAML file, define the variable on the Variables tab. See https://go.microsoft.com/fwlink/?linkid=865972

variables:
 - lsb_release -cs: "focal"
  SSC_CHANGED_PROJECTS: ''
  FSDH_VAULT_NAME: 'fsdh-key-dev'
  FSDH_ACCESS_KEY_SECRET_NAME: 'fsdh-dev-terraform-backend-accesskey'
  SSC_ADDITIONAL_PROJECTS: ''
  FSDH_CLIENT_ID_SECRET_NAME: 'devops-client-id'
  FSDH_CLIENT_SECRET_SECRET_NAME: 'devops-client-secret'
  ARM_TENANT_ID: '8c1a4d93-d828-4d0e-9303-fd3bd611c822'
  OUTPUT_QUEUE_RESOURCE_GROUP_NAME: 'fsdh-dev-rg'
  OUTPUT_QUEUE_STORAGE_ACCOUNT_NAME: 'fsdhstoragedev'
  OUTPUT_QUEUE_NAME: 'terraform-output'

steps:
- bash: |
   # Install software

   echo 'FSDH: Installing GitPython'
   pip install GitPython
   git status

   echo 'FSDH: Install Terraform'
   wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor > /usr/share/keyrings/hashicorp-archive-keyring.gpg
   echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
   sudo apt update && sudo apt install terraform

   echo 'FSDH: Install PS modules'
   pwsh -c "Install-Module -Name SqlServer -AllowClobber -Scope CurrentUser -Force"

   echo 'FSDH: Install PostgreSQL client'
   sudo apt install -y postgresql-client
   sudo ln -s /usr/bin/pwsh /usr/bin/PowerShell

   project_list_csv="simontest"
   echo "##vso[task.setvariable variable=SSC_CHANGED_PROJECTS;]$project_list_csv"
  workingDirectory: '$(System.DefaultWorkingDirectory)/_datahub-project-infrastructure-dev'
  displayName: 'Install software'

- task: AzurePowerShell@5
  displayName: 'Generate a list of changed projects'
  inputs:
    azureSubscription: 'AZRM - DataSolutions'
    ScriptType: InlineScript
    Inline: |
     $project_list = @()
     foreach ($file in (git diff --name-only "HEAD~1")){
         $file_path = @($file -split "/")
         if ($file_path[0] -eq "terraform"  -AND $file_path[1] -eq "projects" -AND $file_path[2] -ne "") {
             write-host "FSDH: Detected change in project: " $file_path[2]
             $project_list += $file_path[2]
         }
     }

     $project_list_csv = (($project_list | Get-Unique) -join ",")
     Write-Host "SSC_CHANGED_PROJECTS=" $project_list_csv
     Write-Host "##vso[task.setvariable variable=SSC_CHANGED_PROJECTS;]$project_list_csv"
    azurePowerShellVersion: LatestVersion
    workingDirectory: '$(System.DefaultWorkingDirectory)/_datahub-project-infrastructure-dev'

- task: AzurePowerShell@5
  displayName: 'Terraform - init'
  inputs:
    azureSubscription: 'AZRM - DataSolutions'
    ScriptType: InlineScript
    Inline: |
     # You can write your azure powershell scripts inline here.
     # You can also pass predefined and custom variables to this script using arguments
     Write-Host "SSC_CHANGED_PROJECTS=" $(SSC_CHANGED_PROJECTS)
     Write-Host "SSC_ADDITIONAL_PROJECTS=" $(SSC_ADDITIONAL_PROJECTS)

     $env:ARM_ACCESS_KEY = Get-AzKeyVaultSecret -VaultName $(FSDH_VAULT_NAME) -Name $(FSDH_ACCESS_KEY_SECRET_NAME) -AsPlainText


     $project_list_csv = "$(SSC_CHANGED_PROJECTS)"
     if (![string]::IsNullOrEmpty("$(SSC_ADDITIONAL_PROJECTS)")) {$project_list_csv += "," + "$(SSC_ADDITIONAL_PROJECTS)"}

     $project_list = ($project_list_csv -split ",")
     foreach ($project in $project_list){
       write-host "FSDH: Processing project $project"
       terraform --version
       pushd $project
       terraform init  --backend-config=project.tfbackend -no-color
       terraform validate
       popd
     }

    azurePowerShellVersion: LatestVersion
    workingDirectory: '$(System.DefaultWorkingDirectory)/_datahub-project-infrastructure-dev/terraform/projects'

- task: AzurePowerShell@5
  displayName: 'Terraform - apply'
  inputs:
    azureSubscription: 'AZRM - DataSolutions'
    ScriptType: InlineScript
    Inline: |
     # You can write your azure powershell scripts inline here.
     # You can also pass predefined and custom variables to this script using arguments
     Write-Host "SSC_CHANGED_PROJECTS=" $(SSC_CHANGED_PROJECTS)
     Write-Host "SSC_ADDITIONAL_PROJECTS=" $(SSC_ADDITIONAL_PROJECTS)

     $env:ARM_ACCESS_KEY = Get-AzKeyVaultSecret -VaultName $(FSDH_VAULT_NAME) -Name $(FSDH_ACCESS_KEY_SECRET_NAME) -AsPlainText

     $env:ARM_CLIENT_ID = Get-AzKeyVaultSecret -VaultName $(FSDH_VAULT_NAME) -Name $(FSDH_CLIENT_ID_SECRET_NAME) -AsPlainText
     $env:ARM_CLIENT_SECRET = Get-AzKeyVaultSecret -VaultName $(FSDH_VAULT_NAME) -Name $(FSDH_CLIENT_SECRET_SECRET_NAME) -AsPlainText

     az login --service-principal -u $env:ARM_CLIENT_ID -p $env:ARM_CLIENT_SECRET --tenant $(ARM_TENANT_ID)

     $project_list_csv = "$(SSC_CHANGED_PROJECTS)"
     if (![string]::IsNullOrEmpty("$(SSC_ADDITIONAL_PROJECTS)")) { $project_list_csv += "," + "$(SSC_ADDITIONAL_PROJECTS)" }

     $error_count=0
     $project_list = ($project_list_csv -split ",")
     foreach ($project in $project_list) {
         write-host "FSDH: Processing project $project"
         terraform --version
         pushd $project
         terraform apply --auto-approve -no-color
         $error_count=$error_count + $LASTEXITCODE
         popd
     }

     exit $error_count
    azurePowerShellVersion: LatestVersion
    workingDirectory: '$(System.DefaultWorkingDirectory)/_datahub-project-infrastructure-dev/terraform/projects'

- task: AzurePowerShell@5
  displayName: 'Terraform - output'
  inputs:
    azureSubscription: 'AZRM - DataSolutions'
    ScriptType: InlineScript
    Inline: |

     # You can write your azure powershell scripts inline here.
     # You can also pass predefined and custom variables to this script using arguments
     Write-Host "SSC_CHANGED_PROJECTS=" $(SSC_CHANGED_PROJECTS)
     Write-Host "SSC_ADDITIONAL_PROJECTS=" $(SSC_ADDITIONAL_PROJECTS)

     $env:ARM_ACCESS_KEY = Get-AzKeyVaultSecret -VaultName $(FSDH_VAULT_NAME) -Name $(FSDH_ACCESS_KEY_SECRET_NAME) -AsPlainText

     $project_list_csv = "$(SSC_CHANGED_PROJECTS)"
     if (![string]::IsNullOrEmpty("$(SSC_ADDITIONAL_PROJECTS)")) {$project_list_csv += "," + "$(SSC_ADDITIONAL_PROJECTS)"}

     $project_list = ($project_list_csv -split ",")
     foreach ($project in $project_list){
       write-host "FSDH: Processing project $project"
       terraform --version
       pushd $project

       $storage = Get-AzStorageAccount -ResourceGroupName $(OUTPUT_QUEUE_RESOURCE_GROUP_NAME) -Name $(OUTPUT_QUEUE_STORAGE_ACCOUNT_NAME)
       $queue = Get-AzStorageQueue -Name $(OUTPUT_QUEUE_NAME) -Context $storage.Context
       $outputJson = terraform output --json -no-color
       $queueMessage = [Microsoft.Azure.Storage.Queue.CloudQueueMessage]::new($outputJson)
       $queue.CloudQueue.AddMessageAsync($queueMessage)
       echo "Sent message to queue for $project"

       popd
     }

    azurePowerShellVersion: LatestVersion
    workingDirectory: '$(System.DefaultWorkingDirectory)/_datahub-project-infrastructure-dev/terraform/projects'
```
