# Challenge 00 - Prerequisites - Ready, Set, GO!

**[Home](../README.md)** - [Next Challenge >](./Challenge-01.md)

## Introduction

Thank you for participating in the AKS Enterprise-Grade. Before you can hack, you will need to set up some prerequisites.

A smart cloud solution architect always has the right tools in their toolbox.

## Description

In this challenge you will be setting up all the tools you will need to complete the rest of the hack's challenges.

### Install Cloud Tools On Your Workstation

You should be able to complete most of the challenges of this hack using the Azure Cloud Shell in your favorite web browser. However, if you work with Azure on a regular basis, you should take the time to install all of the tools on your local workstation.

- [Azure Subscription](https://azure.microsoft.com/en-us/free/)
- [Managing Cloud Resources]()
  - [Azure Portal](https://portal.azure.com/)
  - [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) - up-to-date version
    - **NOTE for Windows users:** Install the Azure CLI on [Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/install) following the instructions for the Linux distribution you are using in WSL.
  - [Azure Cloud Shell](https://learn.microsoft.com/en-us/azure/cloud-shell/overview) (optional)
  - [Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli) - version >= 1.5.5
- [Visual Studio Code](https://code.visualstudio.com/download) (or an IDE of your choice)

### Student Resources

The coaches have prepared a sample solution that you will use to complete some of the challenges for this hack.
The repo for this can be located [here](https://github.com/microsoft/WhatTheHack/): 

## Success Criteria

To complete this challenge successfully, you should be able to:

- Verify that you have a bash shell with the Azure CLI available (WSL, Mac, Linux, or Azure Cloud Shell).
- Verify that running `az --version` shows the version of your Azure CLI.
- Verify that running `terraform --version` shows the version that is at least 1.5.5.

## Learning Resources

- [10 Tips for Never Forgetting Azure CLI Commands](https://www.youtube.com/watch?v=dQw4w9WgXcQ)
- [Kubernetes & Azure: Together Forever](https://www.youtube.com/watch?v=yPYZpwSpKmA)
