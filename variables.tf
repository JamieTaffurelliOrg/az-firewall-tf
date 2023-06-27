variable "resource_group_name" {
  type        = string
  description = "Resource Group name to deploy to"
}

variable "location" {
  type        = string
  description = "Location of the firewall"
}

variable "public_ip_name" {
  type        = string
  description = "Name of the public IP of the firewall"
}

variable "public_ip_domain_name_label" {
  type        = string
  default     = null
  description = "Domain label of the public IP of the firewall"
}

variable "idle_timeout_in_minutes" {
  type        = number
  default     = 4
  description = "Idle timeout of the public IP of the firewall"
}

variable "threat_intel_mode" {
  type        = string
  default     = "Deny"
  description = "The operation mode for threat intelligence-based filtering"
}

variable "public_ip_prefix_name" {
  type        = string
  description = "Name of the prefix of the public IP of the firewall"
}

variable "public_ip_prefix_resource_group_name" {
  type        = string
  description = "Resource group name of the prefix of the public IP of the firewall"
}

variable "firewall_name" {
  type        = string
  description = "Name of the firewall"
}

variable "firewall_sku" {
  type        = string
  default     = "Standard"
  description = "Sku of firewall, Basic or Standard"
}

variable "firewall_policy_name" {
  type        = string
  description = "Virtual network of firewall"
}

variable "firewall_policy_resource_group_name" {
  type        = string
  description = "Virtual network resource group name"
}

variable "virtual_network_name" {
  type        = string
  description = "Virtual network of firewall"
}

variable "zone_redundant" {
  type        = bool
  default     = true
  description = "Enable zone redundancy on firewall"
}

variable "log_analytics_workspace_name" {
  type        = string
  description = "Name of Log Analytics Workspace to send diagnostics"
}

variable "log_analytics_workspace_resource_group_name" {
  type        = string
  description = "Resource Group of Log Analytics Workspace to send diagnostics"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply"
}
