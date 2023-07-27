terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.11.0"
    }
  }

  backend "s3" {
    bucket         	   = "terraform-state-kusumsiri" 
    key              	 = "state/terraform.tfstate"
    region         	   = "us-east-1"
    encrypt        	   = true
    dynamodb_table     = "terraform-state-locking"
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  # config_context = "minikube"
  config_context = "microk8s"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}