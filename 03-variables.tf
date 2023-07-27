variable "k8_namespace" {
  description = "The Kubernetes namespace"
  default = "dev"
}

variable "hello_app_name" {
  description = "The hello-app name"
  default = "my-hello-app"
}

variable "external_ips"{
  description = "External IPs to set on LoadBalancer" 
  default = ["1.2.3.4"]
}