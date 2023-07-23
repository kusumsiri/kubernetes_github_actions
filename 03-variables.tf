variable "k8_namespace" {
  description = "The Kubernetes namespace"
  default = "dev"
}

variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}