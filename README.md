<!-- BEGIN_TF_DOCS -->
[![ReadMeSupportPalestine](https://github.com/Safouene1/support-palestine-banner/blob/master/banner-project.svg)](https://github.com/Safouene1/support-palestine-banner)

## Scope

#### In this section we place the scope of the created template/module. ###

## Usage

### Clone project

```
git clone  https://github.com/violenti/aks-terraform-template.git
cd aks-terraform-template/
```

Edit the file terraform.tfvars with your values and the file backend.tf with "subscription_id", "resource_group_name" of your storage account and name in  "storage_account_name".

For to initialize the backend, your can do the next command:

```
terraform init -reconfigure -backend-config="key="placeholder.tfstate -backend-config="container_name=placeholder"
```

```
terraform validate

terraform plan

terraform apply
```

### Installation of pre-commit for Ubuntu 20.04 and higher

```
sudo apt update
sudo apt install -y unzip software-properties-common python3 python3-pip

python3 -m pip install --upgrade pip

pip/pip3 install -r requirements.txt

curl -L "$(curl -s https://api.github.com/repos/terraform-docs/terraform-docs/releases/latest | grep -o -E -m 1 "https://.+?-linux-amd64.tar.gz")" > terraform-docs.tgz && tar -xzf terraform-docs.tgz terraform-docs && rm terraform-docs.tgz && chmod +x terraform-docs && sudo mv terraform-docs /usr/bin/
cd <project_folder_name>/
pre-commit install
```

### Installation of pre-commitand terraform docs for MacOS with Brew

```
brew install pre-commit terraform-docs
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.71.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_portal_fqdn"></a> [cluster\_portal\_fqdn](#output\_cluster\_portal\_fqdn) | n/a |
| <a name="output_cluster_private_fqdn"></a> [cluster\_private\_fqdn](#output\_cluster\_private\_fqdn) | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_agents_availability_zones"></a> [agents\_availability\_zones](#input\_agents\_availability\_zones) | n/a | `list(string)` | <pre>[<br>  "2"<br>]</pre> | no |
| <a name="input_agents_count"></a> [agents\_count](#input\_agents\_count) | n/a | `number` | `2` | no |
| <a name="input_agents_max_count"></a> [agents\_max\_count](#input\_agents\_max\_count) | n/a | `number` | `3` | no |
| <a name="input_agents_max_pods"></a> [agents\_max\_pods](#input\_agents\_max\_pods) | n/a | `number` | `100` | no |
| <a name="input_agents_min_count"></a> [agents\_min\_count](#input\_agents\_min\_count) | n/a | `number` | `1` | no |
| <a name="input_agents_pool_name"></a> [agents\_pool\_name](#input\_agents\_pool\_name) | n/a | `string` | `"nodepool"` | no |
| <a name="input_agents_size"></a> [agents\_size](#input\_agents\_size) | n/a | `string` | `"Standard_D2s_v3"` | no |
| <a name="input_agents_type"></a> [agents\_type](#input\_agents\_type) | n/a | `string` | `"VirtualMachineScaleSets"` | no |
| <a name="input_automatic_channel_upgrade"></a> [automatic\_channel\_upgrade](#input\_automatic\_channel\_upgrade) | n/a | `string` | `"patch"` | no |
| <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_azurerm_log_analytics_workspace_sku"></a> [azurerm\_log\_analytics\_workspace\_sku](#input\_azurerm\_log\_analytics\_workspace\_sku) | PerGB2018 is pay as you go | `string` | `"PerGB2018"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | n/a | `bool` | `true` | no |
| <a name="input_ebpf_data_plane"></a> [ebpf\_data\_plane](#input\_ebpf\_data\_plane) | n/a | `string` | `"cilium"` | no |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | n/a | `bool` | `true` | no |
| <a name="input_enable_host_encryption"></a> [enable\_host\_encryption](#input\_enable\_host\_encryption) | n/a | `bool` | `false` | no |
| <a name="input_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#input\_http\_application\_routing\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_ingress_application_gateway_enabled"></a> [ingress\_application\_gateway\_enabled](#input\_ingress\_application\_gateway\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_key_vault_firewall_bypass_ip_cidr"></a> [key\_vault\_firewall\_bypass\_ip\_cidr](#input\_key\_vault\_firewall\_bypass\_ip\_cidr) | n/a | `string` | `null` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | n/a | `string` | `"1.26"` | no |
| <a name="input_local_account_disabled"></a> [local\_account\_disabled](#input\_local\_account\_disabled) | n/a | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"eastus2"` | no |
| <a name="input_log_analytics_workspace_enabled"></a> [log\_analytics\_workspace\_enabled](#input\_log\_analytics\_workspace\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_log_analytics_workspace_location"></a> [log\_analytics\_workspace\_location](#input\_log\_analytics\_workspace\_location) | n/a | `string` | `""` | no |
| <a name="input_net_profile_dns_service_ip"></a> [net\_profile\_dns\_service\_ip](#input\_net\_profile\_dns\_service\_ip) | n/a | `string` | `"11.33.0.10"` | no |
| <a name="input_net_profile_service_cidr"></a> [net\_profile\_service\_cidr](#input\_net\_profile\_service\_cidr) | n/a | `string` | `"11.33.0.0/16"` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | n/a | `string` | `"azure"` | no |
| <a name="input_network_plugin_mode"></a> [network\_plugin\_mode](#input\_network\_plugin\_mode) | n/a | `string` | `"Overlay"` | no |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | n/a | `string` | `null` | no |
| <a name="input_oidc_issuer_enabled"></a> [oidc\_issuer\_enabled](#input\_oidc\_issuer\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_os_disk_size_gb"></a> [os\_disk\_size\_gb](#input\_os\_disk\_size\_gb) | n/a | `number` | `120` | no |
| <a name="input_os_disk_type"></a> [os\_disk\_type](#input\_os\_disk\_type) | n/a | `string` | `"Managed"` | no |
| <a name="input_os_sku"></a> [os\_sku](#input\_os\_sku) | n/a | `string` | `"Ubuntu"` | no |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_rbac_aad"></a> [rbac\_aad](#input\_rbac\_aad) | n/a | `bool` | `true` | no |
| <a name="input_rbac_aad_admin_group_object_ids"></a> [rbac\_aad\_admin\_group\_object\_ids](#input\_rbac\_aad\_admin\_group\_object\_ids) | n/a | `list(string)` | <pre>[<br>  "d7365ac1-d785-4e73-acd3-24c09106063c"<br>]</pre> | no |
| <a name="input_rbac_aad_azure_rbac_enabled"></a> [rbac\_aad\_azure\_rbac\_enabled](#input\_rbac\_aad\_azure\_rbac\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_rbac_aad_managed"></a> [rbac\_aad\_managed](#input\_rbac\_aad\_managed) | n/a | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `null` | no |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | n/a | `number` | `90` | no |
| <a name="input_role_based_access_control_enabled"></a> [role\_based\_access\_control\_enabled](#input\_role\_based\_access\_control\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_secret_rotation_enabled"></a> [secret\_rotation\_enabled](#input\_secret\_rotation\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | n/a | `string` | `"Free"` | no |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | n/a | `string` | n/a | yes |
| <a name="input_workload_identity_enabled"></a> [workload\_identity\_enabled](#input\_workload\_identity\_enabled) | n/a | `bool` | `true` | no |
<!-- END_TF_DOCS -->