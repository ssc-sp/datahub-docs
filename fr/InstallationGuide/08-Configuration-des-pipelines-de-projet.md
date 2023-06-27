---
remarks: Automatically translated with DeepL
source: /InstallationGuide/08-Project-Pipelines-Setup.md
draft: true
---

## Azure Devops CD

Ce guide vous guidera à travers les étapes de la configuration d'Azure DevOps pour l'infrastructure du projet DataHub.

## Créer un pipeline de diffusion

Vous devrez créer un pipeline de versions pour l'infrastructure du projet.

## Exemple de pipeline de diffusion

Ce qui suit est un exemple de pipeline de diffusion pour les pipelines terraform des projets Datahub. Vous pouvez l'utiliser comme référence pour créer le vôtre.

``yaml

#Votre pipeline de construction fait référence à une variable non définie nommée 'lsb_release -cs'. Créez ou éditez le pipeline de construction pour ce fichier YAML, définissez la variable dans l'onglet Variables. Voir https://go.microsoft.com/fwlink/?linkid=865972

variables :
 - lsb_release -cs : "focal"
  SPC_CHANGED_PROJECTS : ''
  DHSF_VAULT_NAME : 'fsdh-key-dev'
  DHSF_ACCESS_KEY_SECRET_NAME : 'fsdh-dev-terraform-backend-accesskey'
  SPC_PROJETS_COMPLÉMENTAIRES : ''
  DHSF_ILCENT_ID_SECRET_NAME : 'devops-client-id'
  DHSF_ILCENT_SECRET_SECRET_NAME : 'devops-client-secret'
  ARM_TENANT_ID: '8c1a4d93-d828-4d0e-9303-fd3bd611c822'
  OUTPUT_QUEUE_RESOURCE_GROUP_NAME : 'fsdh-dev-rg'
  OUTPUT_QUEUE_STORAGE_ACCOUNT_NAME : 'fsdhstoragedev'
  OUTPUT_QUEUE_NAME : 'terraform-output'

étapes :
- bash : 
   # Installer le logiciel

   echo 'DHSF : Installation de GitPython'
   pip install GitPython
   git status

   echo 'DHSF : Install Terraform'
   wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor > /usr/share/keyrings/hashicorp-archive-keyring.gpg
   echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
   sudo apt update && sudo apt install terraform

   echo 'DHSF : Installer les modules PS'
   pwsh -c "Install-Module -Name SqlServer -AllowClobber -Scope CurrentUser -Force"

   echo 'DHSF : Installer le client PostgreSQL'
   sudo apt install -y postgresql-client
   sudo ln -s /usr/bin/pwsh /usr/bin/PowerShell

   project_list_csv="simontest"
   echo "##vso[task.setvariable variable=SPC_CHANGED_PROJECTS ;]$project_list_csv"
  workingDirectory : '$(System.DefaultWorkingDirectory)/_datahub-project-infrastructure-dev'
  displayName : 'Installer le logiciel'

- tâche : AzurePowerShell@5
  displayName : 'Générer une liste de projets modifiés'
  les entrées :
    azureSubscription : 'AZRM - DataSolutions'
    Type de script : InlineScript
    En ligne : 
     $project_list = @()
     foreach ($file in (git diff --name-only "HEAD~1")){
         $file_path = @($file -split "/")
         if ($file_path[0] -eq "terraform" -AND $file_path[1] -eq "projects" -AND $file_path[2] -ne "") {
             write-host "DHSF : Changement détecté dans le projet : "$file_path[2]
             $project_list += $file_path[2]
         }
     }

     $project_list_csv = (($project_list | Get-Unique) -join ",")
     Write-Host "SPC_CHANGED_PROJECTS=" $project_list_csv
     Write-Host "##vso[task.setvariable variable=SPC_CHANGED_PROJECTS ;]$project_list_csv"
    azurePowerShellVersion : DernièreVersion
    workingDirectory : '$(System.DefaultWorkingDirectory)/_datahub-project-infrastructure-dev'

- tâche : AzurePowerShell@5
  displayName : 'Terraform - init'
  les entrées :
    azureSubscription : 'AZRM - DataSolutions'
    Type de script : InlineScript
    En ligne : 
     # Vous pouvez écrire vos scripts azure powershell en ligne ici.
     # Vous pouvez également passer des variables prédéfinies et personnalisées à ce script en utilisant des arguments
     Write-Host "SPC_CHANGED_PROJECTS=" $(SPC_CHANGED_PROJECTS)
     Write-Host "SPC_ADDITIONAL_PROJECTS=" $(SPC_ADDITIONAL_PROJECTS)

     $env:ARM_ACCESS_KEY = Get-AzKeyVaultSecret -VaultName $(DHSF_VAULT_NAME) -Name $(DHSF_ACCESS_KEY_SECRET_NAME) -AsPlainText


     $project_list_csv = "$(SPC_CHANGED_PROJECTS)"
     if ( ![string]::IsNullOrEmpty("$(SPC_ADDITIONAL_PROJECTS)")) {$project_list_csv += "," + "$(SPC_ADDITIONAL_PROJECTS)"}.

     $project_list = ($project_list_csv -split ",")
     foreach ($project in $project_list){
       write-host "DHSF : Traitement du projet $project"
       terraform --version
       pushd $projet
       terraform init --backend-config=project.tfbackend -no-color
       valider la terraforme
       popd
     }

    azurePowerShellVersion : DernièreVersion
    workingDirectory : '$(System.DefaultWorkingDirectory)/_datahub-project-infrastructure-dev/terraform/projects'

- tâche : AzurePowerShell@5
  displayName : 'Terraform - apply'
  les entrées :
    azureSubscription : 'AZRM - DataSolutions'
    Type de script : InlineScript
    En ligne : 
     # Vous pouvez écrire vos scripts azure powershell en ligne ici.
     # Vous pouvez également passer des variables prédéfinies et personnalisées à ce script en utilisant des arguments
     Write-Host "SPC_CHANGED_PROJECTS=" $(SPC_CHANGED_PROJECTS)
     Write-Host "SPC_ADDITIONAL_PROJECTS=" $(SPC_ADDITIONAL_PROJECTS)

     $env:ARM_ACCESS_KEY = Get-AzKeyVaultSecret -VaultName $(DHSF_VAULT_NAME) -Name $(DHSF_ACCESS_KEY_SECRET_NAME) -AsPlainText

     $env:ARM_ILCENT_ID = Get-AzKeyVaultSecret -VaultName $(DHSF_VAULT_NAME) -Name $(DHSF_ILCENT_ID_SECRET_NAME) -AsPlainText
     $env:ARM_ILCENT_SECRET = Get-AzKeyVaultSecret -VaultName $(DHSF_VAULT_NAME) -Name $(DHSF_ILCENT_SECRET_SECRET_NAME) -AsPlainText

     az login --service-principal -u $env:ARM_ILCENT_ID -p $env:ARM_ILCENT_SECRET --tenant $(ARM_TENANT_ID)

     $project_list_csv = "$(SPC_CHANGED_PROJECTS)"
     if ( ![string]::IsNullOrEmpty("$(SPC_ADDITIONAL_PROJECTS)")) { $project_list_csv += "," + "$(SPC_ADDITIONAL_PROJECTS)" }

     $error_count=0
     $project_list = ($project_list_csv -split ",")
     foreach ($project in $project_list) {
         write-host "DHSF : Traitement du projet $project"
         terraform --version
         pushd $projet
         terraform apply --auto-approve -no-color
         $error_count=$error_count + $LASTEXITCODE
         popd
     }

     exit $error_count
    azurePowerShellVersion : DernièreVersion
    workingDirectory : '$(System.DefaultWorkingDirectory)/_datahub-project-infrastructure-dev/terraform/projects'

- tâche : AzurePowerShell@5
  displayName : 'Terraform - output'
  les entrées :
    azureSubscription : 'AZRM - DataSolutions'
    Type de script : InlineScript
    En ligne : 

     # Vous pouvez écrire vos scripts azure powershell en ligne ici.
     # Vous pouvez également passer des variables prédéfinies et personnalisées à ce script en utilisant des arguments
     Write-Host "SPC_CHANGED_PROJECTS=" $(SPC_CHANGED_PROJECTS)
     Write-Host "SPC_ADDITIONAL_PROJECTS=" $(SPC_ADDITIONAL_PROJECTS)

     $env:ARM_ACCESS_KEY = Get-AzKeyVaultSecret -VaultName $(DHSF_VAULT_NAME) -Name $(DHSF_ACCESS_KEY_SECRET_NAME) -AsPlainText

     $project_list_csv = "$(SPC_CHANGED_PROJECTS)"
     if ( ![string]::IsNullOrEmpty("$(SPC_ADDITIONAL_PROJECTS)")) {$project_list_csv += "," + "$(SPC_ADDITIONAL_PROJECTS)"}.

     $project_list = ($project_list_csv -split ",")
     foreach ($project in $project_list){
       write-host "DHSF : Traitement du projet $project"
       terraform --version
       pushd $projet

       $storage = Get-AzStorageAccount -ResourceGroupName $(OUTPUT_QUEUE_RESOURCE_GROUP_NAME) -Name $(OUTPUT_QUEUE_STORAGE_ACCOUNT_NAME)
       $queue = Get-AzStorageQueueue -Name $(OUTPUT_QUEUE_NAME) -Context $storage.Context
       $outputJson = terraform output --json -no-color
       $queueMessage = [Microsoft.Azure.Storage.Queue.CloudQueueMessage]::new($outputJson)
       $queue.CloudQueueue.AddMessageAsync($queueMessage)
       echo "Sent message to queue for $project" (message envoyé à la file d'attente pour $projet)

       popd
     }

    azurePowerShellVersion : DernièreVersion
    workingDirectory : '$(System.DefaultWorkingDirectory)/_datahub-project-infrastructure-dev/terraform/projects'
```
