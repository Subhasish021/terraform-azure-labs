#######################################################
# Resource Group
#######################################################

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

#######################################################
# Storage Accounts (count)
#######################################################

output "storage_account_names" {
  value = azurerm_storage_account.storage[*].name
}

#######################################################
# Network Security Groups (for_each)
#######################################################

output "network_security_group_names" {
  value = keys(azurerm_network_security_group.nsg)
}

#######################################################
# Recovery Services Vault
#######################################################

output "recovery_services_vault_name" {
  value = var.environment == "prod" ? azurerm_recovery_services_vault.rsv[0].name : "Not Created (Dev Environment)"
}

#######################################################
# Lifecycle Demo
#######################################################

output "critical_storage_account" {
  value = azurerm_storage_account.critical_storage.name
}