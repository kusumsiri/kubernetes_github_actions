resource "kubernetes_deployment" "hello-app" {
  metadata {
    name = var.hello_app_name
    namespace  = var.k8_namespace
    labels = {
      App = var.hello_app_name
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        App = var.hello_app_name
      }
    }
    template {
      metadata {
        labels = {
          App = var.hello_app_name
        }
      }
      spec {
        container {
          image = "registry.k8s.io/e2e-test-images/echoserver:2.3"
          name  = var.hello_app_name

          port {
            container_port = 8080
          }

          resources {
            limits = {
              cpu    = "500m"
              memory = "32Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "32Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "http-svc" {
  metadata {
    name = var.hello_app_name
    namespace  = var.k8_namespace
  }
  spec {
    selector = {
      App = var.hello_app_name
    }
    port {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
    external_ips = var.external_ips
  }
}
