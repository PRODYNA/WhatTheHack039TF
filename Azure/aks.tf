// Create Kubernetes cluster (AKS)
module "aks" {
  source                               = "Azure/aks/azurerm"
  resource_group_name                  = azurerm_resource_group.hack.name
  location                             = azurerm_resource_group.hack.location
  node_resource_group                  = "${azurerm_resource_group.hack.name}-aks-resources"
  client_id                            = ""
  client_secret                        = ""
  kubernetes_version                   = "1.27"
  orchestrator_version                 = "1.27"
  automatic_channel_upgrade            = "patch"
  prefix                               = "default"
  cluster_name                         = local.common-name
  network_plugin                       = "azure"
  vnet_subnet_id                       = module.network.vnet_subnets[0]
  os_disk_size_gb                      = 50
  sku_tier                             = "Free" # defaults to Free
  rbac_aad                             = false
  role_based_access_control_enabled    = false
  rbac_aad_admin_group_object_ids      = null
  rbac_aad_managed                     = false
  private_cluster_enabled              = false
  // Not using this one, since we are deploying the ingress-nginx ourselves
  http_application_routing_enabled     = false
  azure_policy_enabled                 = true
  enable_host_encryption               = false

  // TODO: Enable autoscaling with nodecount 1..2
  agents_max_pods                      = 100
  agents_pool_name                     = "exnodepool"
  agents_availability_zones            = []
  agents_type                          = "VirtualMachineScaleSets"
  agents_size                          = "standard_d2ds_v4"

  // TODO: Activate log analytics workspace
  log_analytics_workspace_enabled      = false
  cluster_log_analytics_workspace_name = "${local.common-name}-aks"

  attached_acr_id_map = {
    "hack_acr" : azurerm_container_registry.hack.id
  }

  agents_labels = {
    "nodepool" : "defaultnodepool"
  }

  agents_tags = {
    "Agent" : "defaultnodepoolagent"
  }

  ingress_application_gateway_enabled          = false
  ingress_application_gateway_name             = "${local.common-name}-agw"
  ingress_application_gateway_subnet_id        = module.network.vnet_subnets[1]
  network_contributor_role_assigned_subnet_ids = {
    aks-agw-snet = module.network.vnet_subnets[1]
  }

  network_policy             = "azure"
  net_profile_dns_service_ip = "10.0.0.10"
  net_profile_service_cidr   = "10.0.0.0/16"

  // TODO: Enable prometheus add-on profile

  depends_on = [module.network]
}

// wait 2 minutes for the cluster to be ready
resource "time_sleep" "wait_2_minutes" {
  depends_on = [
    module.aks
  ]
  create_duration = "2m"
}

// Load the credentials into the local kubeconfig
resource "null_resource" "get-credentials" {
  provisioner "local-exec" {
    command = "az aks get-credentials -g ${azurerm_resource_group.hack.name} -n ${local.common-name} --overwrite-existing"
  }
  depends_on = [
    time_sleep.wait_2_minutes
  ]
}
