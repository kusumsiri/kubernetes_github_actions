variable "k8_namespace" {
  description = "The Kubernetes namespace"
  default = "dev"
}

variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}

variable "hello_app_name" {
  description = "The HELLO app name"
  default = "http-svc"
}

variable "kube-version" {
  description = "The kube-version"
  default = "36.2.0"
}
