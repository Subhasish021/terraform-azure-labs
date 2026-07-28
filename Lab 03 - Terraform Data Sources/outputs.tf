#########################################
# Data Source Outputs
#########################################

output "existing_resource_group_name" {
  description = "Existing Resource Group Name"
  value       = data.azurerm_resource_group.existing_rg.name
}

output "existing_resource_group_location" {
  description = "Existing Resource Group Location"
  value       = data.azurerm_resource_group.existing_rg.location
}

#########################################
# Resource Outputs
#########################################

output "network_security_group_name" {
  description = "Network Security Group Name"
  value       = azurerm_network_security_group.nsg.name
}

output "network_security_group_id" {
  description = "Network Security Group ID"
  value       = azurerm_network_security_group.nsg.id
}