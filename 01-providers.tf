terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.11.0"
    }
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
