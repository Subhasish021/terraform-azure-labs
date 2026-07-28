#######################################################
# Resource Group
#######################################################

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

#######################################################
# Storage Accounts using COUNT
#######################################################

resource "azurerm_storage_account" "storage" {

  count = var.storage_account_count

  name                     = "${local.storage_prefix}${count.index}12345"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

#######################################################
# Network Security Groups using FOR_EACH
#######################################################

resource "azurerm_network_security_group" "nsg" {

  for_each = var.nsg_names

  name                = "${each.value}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

#######################################################
# Recovery Services Vault
# Created ONLY for Production
#######################################################

resource "azurerm_recovery_services_vault" "rsv" {

  count = var.environment == "prod" ? 1 : 0

  name                = local.recovery_vault_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku = "Standard"

  tags = var.tags
}

#######################################################
# Lifecycle Demonstration
#######################################################

resource "azurerm_storage_account" "critical_storage" {

  name                     = "criticalst12345"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  lifecycle {

    prevent_destroy = true

    ignore_changes = [
      tags
    ]

  }

  tags = var.tags
}