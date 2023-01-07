output "public_ip_id" {
  value       = azurerm_public_ip.firewall_public_ip.id
  description = "The resource ID of the public IP"
}

output "public_ip_address" {
  value       = azurerm_public_ip.firewall_public_ip.ip_address
  description = "The ip address of the public IP"
}

output "firewall" {
  value       = azurerm_firewall.firewall
  description = "The firewall properties"
}
