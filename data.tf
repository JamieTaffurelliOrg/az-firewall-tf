data "azurerm_public_ip_prefix" "ip_prefix" {
  name                = var.public_ip_prefix_name
  resource_group_name = var.public_ip_prefix_resource_group_name
}

data "azurerm_subnet" "firewall_subnet" {
  name                 = "AzureFirewallSubnet"
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.virtual_network_resource_group_name
}

data "azurerm_firewall_policy" "firewall_policy" {
  name                = var.firewall_policy_name
  resource_group_name = var.firewall_policy_resource_group_name
}

data "azurerm_log_analytics_workspace" "logs" {
  provider            = azurerm.logs
  name                = var.log_analytics_workspace_name
  resource_group_name = var.log_analytics_workspace_resource_group_name
}
