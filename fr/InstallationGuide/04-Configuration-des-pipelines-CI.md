---
remarks: Automatically translated with DeepL
source: /InstallationGuide/04-CI-Pipelines-Setup.md
draft: true
---

## Azure Devops CI

Ce guide vous guidera à travers les étapes de la configuration d'Azure DevOps pour DataHub.

## Créer des artefacts de construction

Vous devrez créer un artefact de construction pour les composants suivants :

- Portail DataHub
- Fonctions de DataHub
- Fonctions du fournisseur de ressources

## Exemple de pipeline de construction

Voici un exemple de pipeline de construction pour les artefacts DataHub. Vous pouvez l'utiliser comme référence pour créer vos propres pipelines de construction.

``yaml
# 'Allow scripts to access the OAuth token' a été sélectionné dans le pipeline.  Ajoutez le YAML suivant à toutes les étapes nécessitant un accès :
# env :
# MY_ACCESS_TOKEN : $(System.AccessToken)
# La variable 'target_os' a été définie dans l'onglet Variables
# La variable 'version.MajorMinor' a été définie dans l'onglet Variables
# La variable 'version.Revision' a été définie dans l'onglet Variables
déclencher :
  branches :
    inclure :
      - développer
  lot : Vrai
ressources :
  des référentiels :
    - référentiel : self
      type : git
      ref : refs/heads/develop
emplois :
  - job : Job_1
    displayName : "Agent job : prepare"
    piscine :
      vmImage : ubuntu-latest
    étapes :
      - checkout : self
        propre : vrai
        lfs : true
        fetchTags : false
      - tâche : UseDotNet@2
        nom d'affichage : Utiliser .NET Core sdk 7.0.x
        les entrées :
          version : 7.0.x
          includePreviewVersions : true
          performMultiLevelLookup : true
      - tâche : NodeTool@0
        nom d'affichage : Utiliser le nœud 15.11.0
        les entrées :
          versionSpec : 15.11.0
      - tâche : PowerShell@2
        nom d'affichage : "Script PowerShell : Définir le numéro de build"
        les entrées :
          targetType : inline
          script : >-
            [string] $dateCode = (Get-Date -Format 'yyyyMMdd')

            [string] $buildName = "$(version.MajorMinor).$(version.Revision)_$dateCode"


            Write-Host "Définition du nom de la construction à '$buildName'".

            Write-Host "##vso[build.updatebuildnumber]$buildName"
  - emploi : Emploi_2
    displayName : Agent job - build portal app
    dépend de : Job_1
    piscine :
      vmImage : ubuntu-latest
    étapes :
      - checkout : self
        propre : vrai
        lfs : true
        fetchTags : false
      - tâche : PowerShell@2
        nom d'affichage : PowerShell Script - copy appsettings
        les entrées :
          targetType : inline
          script : "cd Portal/src\n $files=Get-Childitem -Path Datahub.Portal -Include appsettings*json-tmpl,launch*json-tmpl -File -Recurse -ErrorAction SilentlyContinue | Where {$_.FullName -notlike \N "*\NDebug\N"}n foreach ($file in $files){\n $fileRendered=$file.FullName.trim(\N"-tmpl\N")\n Write-Host \N "Processing file : ${fichier} > $fileRendered"\N- Copy-Item $file.FullName -Force -Destination $fileRendered\N }\N cd Datahub.Portal ; mv appsettings.Development.json appsettings.dev.json ; Move-Item -Force appsettings.json-tmpl-spdatahub appsettings.json\n "
      - tâche : DotNetCoreILC@2
        displayName : dotnet restore
        les entrées :
          commande : restaurer
          projets : Portal/src/Datahub.Portal/*.csproj
      - tâche : DotNetCoreILC@2
        displayName : dotnet build
        les entrées :
          projets : Portal/src/Datahub.Portal/*.csproj
          arguments : --configuration $(BuildConfiguration)
      - tâche : DotNetCoreILC@2
        displayName : dotnet publish
        les entrées :
          commande : publier
          arguments : -o $(Build.ArtifactStagingDirectory)/output/portal -r $(target_os) --self-contained true
      - tâche : PublishBuildArtifacts@1
        displayName : "Publier l'artefact : datahub-portal"
        les entrées :
          PathtoPublish : $(Build.ArtifactStagingDirectory)/output/portal
          Nom de l'artefact : datahub-portal
  - emploi : Emploi_3
    displayName : Agent job - build function app
    dépend de : Job_1
    piscine :
      vmImage : ubuntu-latest
    étapes :
      - checkout : self
        propre : vrai
        lfs : true
        fetchTags : false
      - tâche : DotNetCoreILC@2
        displayName : dotnet restore
        les entrées :
          commande : restaurer
          projets : Portal/src/Datahub.Functions/*.csproj
      - tâche : DotNetCoreILC@2
        displayName : dotnet build
        les entrées :
          projets : Portal/src/Datahub.Functions/*.csproj
          arguments : --configuration $(BuildConfiguration)
      - tâche : DotNetCoreILC@2
        displayName : dotnet publish
        les entrées :
          commande : publier
          publishWebProjects : false
          projets : Portal/src/Datahub.Functions/*.csproj
          arguments : -o $(Build.ArtifactStagingDirectory)/output/portal -r $(target_os) --self-contained true
      - tâche : PublishBuildArtifacts@1
        displayName : "Publier l'artefact : datahub-function"
        les entrées :
          PathtoPublish : $(Build.ArtifactStagingDirectory)/output/portal
          Nom de l'artefact : datahub-function
  - emploi : Emploi_5
    displayName : Agent job - build resource provisioner function app
    dépend de : Job_1
    piscine :
      vmImage : ubuntu-latest
    étapes :
      - checkout : self
        propre : vrai
        lfs : true
        fetchTags : false
      - tâche : DotNetCoreILC@2
        displayName : dotnet restore
        les entrées :
          commande : restaurer
          projets : ResourceProvisioner/src/ResourceProvisioner.Functions/*.csproj
      - tâche : DotNetCoreILC@2
        displayName : dotnet build
        les entrées :
          projets : ResourceProvisioner/src/ResourceProvisioner.Functions/*.csproj
          arguments : --configuration $(BuildConfiguration)
      - tâche : DotNetCoreILC@2
        displayName : dotnet publish
        les entrées :
          commande : publier
          publishWebProjects : false
          projets : ResourceProvisioner/src/ResourceProvisioner.Functions/*.csproj
          arguments : -o $(Build.ArtifactStagingDirectory)/output/resourceprovisioner -r $(target_os) --self-contained true
      - tâche : PublishBuildArtifacts@1
        displayName : "Publier l'artefact : resource-provisioner-function"
        les entrées :
          PathtoPublish : $(Build.ArtifactStagingDirectory)/output/resourceprovisioner
          Nom de l'artefact : resource-provisioner-function
  - emploi : Emploi_4
    displayName : Agent job - post-build
    dépend de :
      - Emploi_1
      - Emploi_2
      - Emploi_3
    piscine :
      vmImage : ubuntu-latest
    étapes :
      - checkout : self
        propre : vrai
        lfs : true
        fetchTags : false
        persistCredentials : True
      - tâche : PowerShell@2
        nom d'affichage : Script PowerShell
        les entrées :
          targetType : inline
          script : >-
            git config --global user.name "AzureDevOps Agent"

            $versionNumber="$(build.buildNumber)"


            git tag "$versionNumber" --force

            git push origin "$versionNumber" --force

            Write-Output "Tagging $(Build.Repository.Name) with $versionNumber"
```
