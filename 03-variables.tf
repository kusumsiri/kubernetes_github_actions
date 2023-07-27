variable "k8_namespace" {
  description = "The Kubernetes namespace"
  default = "dev"
}

variable "hello_app_name" {
  description = "The hello-app name"
  default = "my-hello-all"
}

variable "external_ips"{
  description = "External IPs to set on LoadBalancer" 
  default = ["195.201.150.42"]
}