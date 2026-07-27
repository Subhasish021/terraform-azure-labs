output "resource_group_name" {

  value = azurerm_resource_group.rg.name

}

output "resource_group_location" {

  value = azurerm_resource_group.rg.location

}

output "vm_count" {

  value = var.vm_count

}

output "enable_backup" {

  value = var.enable_backup

}

output "subnets" {

  value = var.subnets

}

output "tags" {

  value = var.tags

}

output "admin_password" {

  value = var.admin_password

  sensitive = true

}