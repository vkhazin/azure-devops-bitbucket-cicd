#!/bin/bash

# Variables: Project Configuration
projectName=SampleProject
organization=https://dev.azure.com/exampleOrg/

# Variables: Build Pipeline Configuration
buildPipelineName=testBuildPipelineName
buildPipelineDescription=testBuildPipelineDescription
repositoryType= # {github, tfsgit} Bitbucket not supported yet
repositoryCloneUri= # Repository Url
repoBranch=master
skipFirstRun=false # {true, false}
yamlPipelinePath=/[funcApp.yaml]

# DevOps Extension: Install if not already installed
az extension add --name azure-devops

# Authenticate to Azure DevOps account
az login

# Set Default DevOps Organization
az devops configure \
	--defaults organization=$organization

# Create build pipeline
az pipelines create \
	--name $buildPipelineName \
	--description $buildPipelineName \
	--repository $repositoryCloneUri \
	--branch $repoBranch \
	--repository-type $repositoryType \
	--yaml-path $yamlPipelinePath \
	--project $projectName \
	--org $organization \
	--skip-first-run $skipFirstRun

