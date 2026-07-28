#######################################################
# Resource Group
#######################################################

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

#######################################################
# Virtual Network
#######################################################

output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}

#######################################################
# Subnet
#######################################################

output "subnet_name" {
  value = azurerm_subnet.subnet.name
}

#######################################################
# Network Security Group
#######################################################

output "network_security_group_name" {
  value = azurerm_network_security_group.nsg.name
}

#######################################################
# NSG Association
#######################################################

output "nsg_association_id" {
  value = azurerm_subnet_network_security_group_association.association.id
}