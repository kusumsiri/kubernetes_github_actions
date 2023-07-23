resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.k8_namespace
  }
}
