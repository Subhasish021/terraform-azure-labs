output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "resource_group_name_upper" {
  value = local.rg_name_upper
}

output "resource_group_name_lower" {
  value = local.rg_name_lower
}

output "project_title" {
  value = local.project_title
}

output "project_length" {
  value = local.project_length
}

output "joined_name" {
  value = local.joined_name
}

output "split_name" {
  value = local.split_name
}

output "formatted_name" {
  value = local.formatted_name
}

output "first_four_characters" {
  value = local.first_four_chars
}

output "owner_tag" {
  value = lookup(var.tags, "Owner", "Not Found")
}

output "contains_frontend" {
  value = contains(local.split_name, "dev")
}