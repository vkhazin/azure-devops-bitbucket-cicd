# Azure DevOps Bitbucket CI/CD

## Overview

* Automate setup of ci/cd pipeline on Azure DevOps with Bitbucket.org private repository
* The pipeline will run on commit to master branch
* The pipeline will run unit tests
* The pipeline will generate zip file and upload to Azure storage
* The pipeline will update existing Function App deployment

## Bitbucket.org Ont-Time Setup

* Login to Bitbucket.org
* Select your avatar icon
* Select `Settings` -> `App Passwords`
* Generate a new password with `Repositories -> Write` permissions
* Take a note the password

## Azure DevOps Project One-Time Setup

* Navigate to `Project Settings`
* Select `New service connection`
* Select `Azure Resource Manager`
* Provide `Connection name`
* Select `Scope level` -> `Subscription`
* Select `Subscription` and `Resource group`
* Select `Allow all pipelines to use this connection.`
* Navigate to `Pipelines` -> `Library`
* Create new variable group: `bitbucket-integration`
* Add a new group variable: `bitbucket_username` with your username 
* Add a new group variable `bitbucket_password` with App Password created during Bitbucket setup

## Pipeline Setup, once per Azure Function App

* [azuread-authn-svc](https://vkhazin@bitbucket.org/vktrp/azuread-authn-svc.git) repository has been used to automate the ci/cd
* Azure DevOps does not support Bitbucket with [az cli](https://docs.microsoft.com/en-us/cli/azure/ext/azure-devops/pipelines?view=azure-cli-latest#ext-azure-devops-az-pipelines-create)
* A [script](./pipelineSetup.sh) has been provided for future support when and if becomes available
* Manual steps will be required to enable Bitbucket Cloud to Azure DevOps integration
* [Yaml file](./function-app-pipeline.yaml) will be required in the root of repository with Function App source code
* From [Azure DevOps](https://dev.azure.com/) select `Pipelines` -> `Create Pipeline`
* Select `Bitbucket Cloud` `Yaml`
* Search and select a repository with pipeline yaml present
* Select `Select an existing YAML file`
* Select pipeline definition file
* Save or run the new pipeline