

locals {
  resource_group = {
    name     = var.create_resource_group ? azurerm_resource_group.main[0].name : var.resource_group_name
    location = var.location
  }
}

variable "cluster_name" {
  type = string
}

variable "log_analytics_workspace_location" {
  type    = string
  default = ""

}

variable "retention_in_days" {
  type    = number
  default = 90

}

variable "azurerm_log_analytics_workspace_sku" {
  type        = string
  default     = "PerGB2018"
  description = "PerGB2018 is pay as you go"

}

variable "create_resource_group" {
  type     = bool
  default  = true
  nullable = false
}

variable "resource_group_name" {
  type    = string
  default = null

}

variable "key_vault_firewall_bypass_ip_cidr" {
  type    = string
  default = null
}

variable "location" {
  default = "eastus2"
}


variable "oidc_issuer_enabled" {
  type    = bool
  default = true

}
variable "kubernetes_version" {
  type    = string
  default = "1.26"
}

variable "automatic_channel_upgrade" {
  type    = string
  default = "patch"

}

variable "agents_availability_zones" {
  type    = list(string)
  default = ["2"]

}

variable "agents_count" {
  type    = number
  default = 2

}

variable "agents_max_count" {
  type    = number
  default = 3

}

variable "agents_max_pods" {
  type    = number
  default = 100
}

variable "agents_min_count" {
  type    = number
  default = 1

}

variable "agents_pool_name" {
  type    = string
  default = "nodepool"

}

variable "agents_type" {
  type    = string
  default = "VirtualMachineScaleSets"
}


variable "os_sku" {
  type    = string
  default = "Ubuntu"

}


variable "agents_size" {
  type    = string
  default = "Standard_D2s_v3"

}

variable "azure_policy_enabled" {
  type    = bool
  default = false
}

variable "enable_auto_scaling" {
  type    = bool
  default = true

}

variable "enable_host_encryption" {
  type    = bool
  default = false
}

variable "http_application_routing_enabled" {

  type    = bool
  default = false

}

variable "ingress_application_gateway_enabled" {
  type    = bool
  default = false

}



variable "local_account_disabled" {
  type    = bool
  default = true

}

variable "log_analytics_workspace_enabled" {
  type    = bool
  default = true

}



variable "net_profile_service_cidr" {
  type    = string
  default = "11.33.0.0/16"

}

variable "net_profile_dns_service_ip" {
  type    = string
  default = "11.33.0.10"

}

variable "network_plugin" {
  type    = string
  default = "azure"

}

variable "network_policy" {
  type    = string
  default = null
}

variable "ebpf_data_plane" {
  type    = string
  default = "cilium"

}

variable "network_plugin_mode" {
  type    = string
  default = "Overlay"
}

variable "os_disk_size_gb" {
  type    = number
  default = 120

}

variable "os_disk_type" {
  type    = string
  default = "Managed"

}

variable "private_cluster_enabled" {
  type    = bool
  default = true
}

variable "rbac_aad" {
  type    = bool
  default = true

}

variable "rbac_aad_managed" {
  type    = bool
  default = true

}

variable "rbac_aad_azure_rbac_enabled" {
  type    = bool
  default = false

}
variable "role_based_access_control_enabled" {
  type    = bool
  default = true

}

variable "rbac_aad_admin_group_object_ids" {
  type    = list(string)
  default = ["d7365ac1-d785-4e73-acd3-24c09106063c"]

}

variable "sku_tier" {
  type    = string
  default = "Free"

}
variable "secret_rotation_enabled" {
  type    = bool
  default = false
}


variable "workload_identity_enabled" {
  type    = bool
  default = true

}

variable "vnet_subnet_id" {
  type = string

}