resource "azurerm_public_ip" "firewall_public_ip" {
  name                    = var.public_ip_name
  resource_group_name     = var.resource_group_name
  location                = var.location
  allocation_method       = "Static"
  zones                   = [1, 2, 3]
  ddos_protection_mode    = "VirtualNetworkInherited"
  domain_name_label       = var.public_ip_domain_name_label
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  ip_version              = "IPv4"
  public_ip_prefix_id     = data.azurerm_public_ip_prefix.ip_prefix.id
  sku                     = "Standard"
  sku_tier                = "Regional"
  tags                    = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "public_ip_diagnostics" {
  name                       = "${var.log_analytics_workspace_name}-security-logging"
  target_resource_id         = azurerm_public_ip.firewall_public_ip.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.logs.id

  enabled_log {
    category = "DDoSProtectionNotifications"
  }

  enabled_log {
    category = "DDoSMitigationFlowLogs"
  }

  enabled_log {
    category = "DDoSMitigationReports"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

resource "azurerm_firewall" "firewall" {
  name                = var.firewall_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "AZFW_VNet"
  sku_tier            = var.firewall_sku
  threat_intel_mode   = var.threat_intel_mode
  firewall_policy_id  = data.azurerm_firewall_policy.firewall_policy.id
  zones               = var.zone_redundant == true ? ["1", "2", "3"] : null

  ip_configuration {
    name                 = "primary-config"
    subnet_id            = data.azurerm_subnet.firewall_subnet.id
    public_ip_address_id = azurerm_public_ip.firewall_public_ip.id
  }

  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "firewall_diagnostics" {
  name                       = "${var.log_analytics_workspace_name}-security-logging"
  target_resource_id         = azurerm_firewall.firewall.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.logs.id

  enabled_log {
    category = "AzureFirewallApplicationRule"
  }

  enabled_log {
    category = "AzureFirewallNetworkRule"
  }

  enabled_log {
    category = "AzureFirewallDnsProxy"
  }

  enabled_log {
    category = "AZFWApplicationRule"
  }

  enabled_log {
    category = "AZFWApplicationRuleAggregation"
  }

  enabled_log {
    category = "AZFWDnsQuery"
  }

  enabled_log {
    category = "AZFWFatFlow"
  }

  enabled_log {
    category = "AZFWFatFlow"
  }

  enabled_log {
    category = "AZFWFlowTrace"
  }

  enabled_log {
    category = "AZFWFqdnResolveFailure"
  }

  enabled_log {
    category = "AZFWIdpsSignature"
  }

  enabled_log {
    category = "AZFWNatRule"
  }

  enabled_log {
    category = "AZFWNatRuleAggregation"
  }

  enabled_log {
    category = "AZFWNetworkRule"
  }

  enabled_log {
    category = "AZFWNetworkRuleAggregation"
  }

  enabled_log {
    category = "AZFWThreatIntel"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}
