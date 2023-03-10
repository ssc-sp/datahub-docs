## Azure Devops CI

This guide will walk you through the steps to setup Azure DevOps for DataHub.

## Create build artifacts

You will need to create a build artifact for the following components:

- DataHub Portal
- DataHub Functions
- Resource Provisioner Functions

## Example build pipeline

The following is an example build pipeline for DataHub artifacts. You can use this as a reference to create your own build pipelines.

```yaml
# 'Allow scripts to access the OAuth token' was selected in pipeline.  Add the following YAML to any steps requiring access:
#       env:
#           MY_ACCESS_TOKEN: $(System.AccessToken)
# Variable 'target_os' was defined in the Variables tab
# Variable 'version.MajorMinor' was defined in the Variables tab
# Variable 'version.Revision' was defined in the Variables tab
trigger:
  branches:
    include:
      - develop
  batch: True
resources:
  repositories:
    - repository: self
      type: git
      ref: refs/heads/develop
jobs:
  - job: Job_1
    displayName: "Agent job: prepare"
    pool:
      vmImage: ubuntu-latest
    steps:
      - checkout: self
        clean: true
        lfs: true
        fetchTags: false
      - task: UseDotNet@2
        displayName: Use .NET Core sdk 7.0.x
        inputs:
          version: 7.0.x
          includePreviewVersions: true
          performMultiLevelLookup: true
      - task: NodeTool@0
        displayName: Use Node 15.11.0
        inputs:
          versionSpec: 15.11.0
      - task: PowerShell@2
        displayName: "PowerShell Script: Set build number"
        inputs:
          targetType: inline
          script: >-
            [string] $dateCode = (Get-Date -Format 'yyyyMMdd')

            [string] $buildName = "$(version.MajorMinor).$(version.Revision)_$dateCode"


            Write-Host "Setting the name of the build to '$buildName'."

            Write-Host "##vso[build.updatebuildnumber]$buildName"
  - job: Job_2
    displayName: Agent job - build portal app
    dependsOn: Job_1
    pool:
      vmImage: ubuntu-latest
    steps:
      - checkout: self
        clean: true
        lfs: true
        fetchTags: false
      - task: PowerShell@2
        displayName: PowerShell Script - copy appsettings
        inputs:
          targetType: inline
          script: "cd Portal/src\n      $files=Get-Childitem -Path Datahub.Portal -Include appsettings*json-tmpl,launch*json-tmpl -File -Recurse -ErrorAction SilentlyContinue  | Where {$_.FullName -notlike \"*\\Debug\\*\"}\n      foreach ($file in $files){\n        $fileRendered=$file.FullName.trim(\"-tmpl\")\n        Write-Host \"Processing file: ${file} > $fileRendered\"\n        Copy-Item $file.FullName -Force -Destination $fileRendered\n      }\n      cd Datahub.Portal; mv appsettings.Development.json appsettings.dev.json; Move-Item -Force appsettings.json-tmpl-spdatahub appsettings.json\n    "
      - task: DotNetCoreCLI@2
        displayName: dotnet restore
        inputs:
          command: restore
          projects: Portal/src/Datahub.Portal/*.csproj
      - task: DotNetCoreCLI@2
        displayName: dotnet build
        inputs:
          projects: Portal/src/Datahub.Portal/*.csproj
          arguments: --configuration $(BuildConfiguration)
      - task: DotNetCoreCLI@2
        displayName: dotnet publish
        inputs:
          command: publish
          arguments: -o $(Build.ArtifactStagingDirectory)/output/portal -r $(target_os) --self-contained true
      - task: PublishBuildArtifacts@1
        displayName: "Publish Artifact: datahub-portal"
        inputs:
          PathtoPublish: $(Build.ArtifactStagingDirectory)/output/portal
          ArtifactName: datahub-portal
  - job: Job_3
    displayName: Agent job - build function app
    dependsOn: Job_1
    pool:
      vmImage: ubuntu-latest
    steps:
      - checkout: self
        clean: true
        lfs: true
        fetchTags: false
      - task: DotNetCoreCLI@2
        displayName: dotnet restore
        inputs:
          command: restore
          projects: Portal/src/Datahub.Functions/*.csproj
      - task: DotNetCoreCLI@2
        displayName: dotnet build
        inputs:
          projects: Portal/src/Datahub.Functions/*.csproj
          arguments: --configuration $(BuildConfiguration)
      - task: DotNetCoreCLI@2
        displayName: dotnet publish
        inputs:
          command: publish
          publishWebProjects: false
          projects: Portal/src/Datahub.Functions/*.csproj
          arguments: -o $(Build.ArtifactStagingDirectory)/output/portal -r $(target_os) --self-contained true
      - task: PublishBuildArtifacts@1
        displayName: "Publish Artifact: datahub-function"
        inputs:
          PathtoPublish: $(Build.ArtifactStagingDirectory)/output/portal
          ArtifactName: datahub-function
  - job: Job_5
    displayName: Agent job - build resource provisioner function app
    dependsOn: Job_1
    pool:
      vmImage: ubuntu-latest
    steps:
      - checkout: self
        clean: true
        lfs: true
        fetchTags: false
      - task: DotNetCoreCLI@2
        displayName: dotnet restore
        inputs:
          command: restore
          projects: ResourceProvisioner/src/ResourceProvisioner.Functions/*.csproj
      - task: DotNetCoreCLI@2
        displayName: dotnet build
        inputs:
          projects: ResourceProvisioner/src/ResourceProvisioner.Functions/*.csproj
          arguments: --configuration $(BuildConfiguration)
      - task: DotNetCoreCLI@2
        displayName: dotnet publish
        inputs:
          command: publish
          publishWebProjects: false
          projects: ResourceProvisioner/src/ResourceProvisioner.Functions/*.csproj
          arguments: -o $(Build.ArtifactStagingDirectory)/output/resourceprovisioner -r $(target_os) --self-contained true
      - task: PublishBuildArtifacts@1
        displayName: "Publish Artifact: resource-provisioner-function"
        inputs:
          PathtoPublish: $(Build.ArtifactStagingDirectory)/output/resourceprovisioner
          ArtifactName: resource-provisioner-function
  - job: Job_4
    displayName: Agent job - post-build
    dependsOn:
      - Job_1
      - Job_2
      - Job_3
    pool:
      vmImage: ubuntu-latest
    steps:
      - checkout: self
        clean: true
        lfs: true
        fetchTags: false
        persistCredentials: True
      - task: PowerShell@2
        displayName: PowerShell Script
        inputs:
          targetType: inline
          script: >-
            git config --global user.name "AzureDevOps Agent"

            $versionNumber="$(build.buildNumber)"


            git tag "$versionNumber" --force

            git push origin "$versionNumber" --force

            Write-Output "Tagging $(Build.Repository.Name) with $versionNumber"
```
