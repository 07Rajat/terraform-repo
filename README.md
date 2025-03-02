# terraform-repo

## OpenShift Cluster Deployment on IBM Cloud using Terraform

### Overview

This repository contains Terraform code to deploy an OpenShift cluster on IBM Cloud. The deployment is managed through a Jenkins pipeline that triggers a shell script to execute Terraform commands.

### Prerequisites

Before using this Terraform configuration, ensure you have the following:

An IBM Cloud account

IBM Cloud API key

Terraform installed (>= v1.0)

IBM Cloud CLI installed

# Terraform Configuration

### main.tf

Defines resources for provisioning an OpenShift cluster on IBM Cloud.

### variables.tf

Defines configurable variables used in main.tf, such as API keys, region, and cluster name.

### outputs.tf

Outputs important details like cluster ID and endpoint.

### versions.tf

Required version of terraform, IBMcloud cli and hashicorp