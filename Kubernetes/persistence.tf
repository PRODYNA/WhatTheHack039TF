resource "kubernetes_namespace" "persistence" {
  metadata {
    name = "persistence"
  }
}

// TODO: Deploy helm chart "https://marketplace.azurecr.io/helm/v1/repo" with name "hack-mysql" in namespace "persistence" with values from file "helm/mysql.yaml" and set global.storageClass to local.premium_zrs_storage_class_name