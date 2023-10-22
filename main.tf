# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

terraform {

  required_version = ">= 1.5.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.71.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}


resource "random_id" "prefix" {
  byte_length = 8
}

resource "azurerm_resource_group" "main" {
  count = var.create_resource_group ? 1 : 0

  location = var.location
  name     = coalesce(var.resource_group_name, "${random_id.prefix.hex}-rg")
  # if var.resource_group_name is empty, generate a name
}


resource "azurerm_log_analytics_workspace" "main" {
  location            = coalesce(var.log_analytics_workspace_location, local.resource_group.location)
  name                = var.cluster_name
  resource_group_name = local.resource_group.name
  retention_in_days   = var.retention_in_days
  sku                 = var.azurerm_log_analytics_workspace_sku
}

resource "azurerm_log_analytics_solution" "main" {
  location              = coalesce(var.log_analytics_workspace_location, local.resource_group.location)
  resource_group_name   = local.resource_group.name
  solution_name         = "ContainerInsights"
  workspace_name        = azurerm_log_analytics_workspace.main.name
  workspace_resource_id = azurerm_log_analytics_workspace.main.id

  plan {
    product   = "OMSGallery/ContainerInsights"
    publisher = "Microsoft"
  }
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name                       = var.cluster_name
  target_resource_id         = module.aks.aks_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id
  enabled_log {
    category = "kube-audit"
  }

  enabled_log {
    category = "kube-audit-admin"

  }
  enabled_log {
    category = "kube-apiserver"

  }
  enabled_log {
    category = "kube-scheduler"
  }

  enabled_log {
    category = "guard"
  }

  depends_on = [
    azurerm_log_analytics_solution.main,
    azurerm_log_analytics_workspace.main,
    azurerm_resource_group.main,
    module.aks,
  ]
}

module "aks" {
  source                    = "Azure/aks/azurerm"
  version                   = "7.3.1"
  cluster_name              = var.cluster_name
  prefix                    = var.cluster_name
  resource_group_name       = local.resource_group.name
  kubernetes_version        = var.kubernetes_version
  automatic_channel_upgrade = var.automatic_channel_upgrade
  agents_availability_zones = var.agents_availability_zones
  node_pools = {
    worker = {
      name                   = "worker"
      enable_auto_scaling    = true
      vnet_subnet_id         = var.vnet_subnet_id
      vm_size                = "Standard_D2s_v3"
      enable_auto_scaling    = true
      max_count              = 3
      min_count              = 1
      os_type                = "Linux"
      enable_node_public_ip  = false
      enable_host_encryption = false
      os_disk_size_gb        = 120
      orchestrator_version   = var.kubernetes_version
      pod_max_pid            = 100
      zones                  = var.agents_availability_zones
      mode                   = "User"
    }
  }
  agents_count         = var.agents_count
  agents_max_count     = var.agents_max_count
  agents_max_pods      = var.agents_max_pods
  agents_min_count     = var.agents_min_count
  agents_pool_name     = var.agents_pool_name
  agents_size          = var.agents_size
  orchestrator_version = var.kubernetes_version
  agents_pool_linux_os_configs = [
    {
      transparent_huge_page_enabled = "always"
      sysctl_configs = [
        {
          fs_aio_max_nr               = 65536
          fs_file_max                 = 100000
          fs_inotify_max_user_watches = 1048576
        }
      ]
    }
  ]
  agents_type                          = var.agents_type
  os_sku                               = var.os_sku
  enable_auto_scaling                  = var.enable_auto_scaling
  azure_policy_enabled                 = var.azure_policy_enabled
  enable_host_encryption               = var.enable_host_encryption
  http_application_routing_enabled     = var.http_application_routing_enabled
  ingress_application_gateway_enabled  = var.ingress_application_gateway_enabled
  local_account_disabled               = var.local_account_disabled
  log_analytics_workspace_enabled      = var.log_analytics_workspace_enabled
  cluster_log_analytics_workspace_name = azurerm_log_analytics_workspace.main.name
  log_analytics_solution = {
    id = azurerm_log_analytics_solution.main.id
  }

  log_analytics_workspace = {
    id   = azurerm_log_analytics_workspace.main.id
    name = azurerm_log_analytics_workspace.main.name
  }

  location = var.location
  maintenance_window = {
    allowed = [
      {
        day   = "Sunday",
        hours = [22, 23]
      },
    ]
    not_allowed = [
      {
        start = "2035-01-01T20:00:00Z",
        end   = "2035-01-01T21:00:00Z"
      },
    ]
  }
  network_plugin                    = var.network_plugin
  network_policy                    = var.network_policy
  ebpf_data_plane                   = var.ebpf_data_plane
  network_plugin_mode               = var.network_plugin_mode
  os_disk_size_gb                   = var.os_disk_size_gb
  os_disk_type                      = var.os_disk_type
  private_cluster_enabled           = var.private_cluster_enabled
  rbac_aad                          = var.rbac_aad
  rbac_aad_azure_rbac_enabled       = var.rbac_aad_azure_rbac_enabled
  rbac_aad_managed                  = var.rbac_aad_managed
  role_based_access_control_enabled = var.role_based_access_control_enabled
  rbac_aad_admin_group_object_ids   = var.rbac_aad_admin_group_object_ids
  sku_tier                          = var.sku_tier
  secret_rotation_enabled           = var.secret_rotation_enabled
  vnet_subnet_id                    = var.vnet_subnet_id
  workload_identity_enabled         = var.workload_identity_enabled
  oidc_issuer_enabled               = var.oidc_issuer_enabled

  agents_labels = {
    "node1" : "label1"
    "CreateBy" : "Terraform"
  }
  agents_tags = {
    "Agent" : "agentTag"
    "CreateBy" : "Terraform"
  }
  depends_on = [
    azurerm_resource_group.main,
    azurerm_log_analytics_solution.main,
    azurerm_log_analytics_workspace.main,
  ]

}