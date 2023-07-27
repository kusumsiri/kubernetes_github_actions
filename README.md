# Continuous Deployment to Kubernetes with GitHub Actions
## Introduction

This repository uses the GitHub CI/CD pipeline to deploy applications on a Kubernetes cluster. 

Instead of manually deploying the application via `kubectl` commands or `terraform` commands, the process can be automated with a CI/CD pipeline.
The Terraform backend uses S3 and DynamoDB with state locking.
