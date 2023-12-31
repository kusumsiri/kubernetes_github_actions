terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.11.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket         	   = "terraform-state-kusumsiri" 
    key              	 = "state/terraform.tfstate"
    region         	   = "us-east-1"
    encrypt        	   = true
    dynamodb_table     = "terraform-state-locking_1"
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  # config_context = "minikube"
  config_context = "microk8s"
}

provider "aws" {
  region = "us-east-1"
}