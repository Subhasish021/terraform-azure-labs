#########################################
# Existing Resource Group (Data Source)
#########################################

data "azurerm_resource_group" "existing_rg" {
  name = var.resource_group_name
}

#########################################
# Create Network Security Group
#########################################

resource "azurerm_network_security_group" "nsg" {
  name                = local.final_nsg_name
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name

  tags = var.tags
}