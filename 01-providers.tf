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

resource "aws_dynamodb_table" "state_locking" {
  hash_key = "LockID"
  name     = "terraform-state-locking"
  attribute {
    name = "LockID"
    type = "S"
  }
  billing_mode = "PAY_PER_REQUEST"
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