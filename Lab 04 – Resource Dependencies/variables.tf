variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "subnet_name" {
  description = "Subnet Name"
  type        = string
}

variable "nsg_name" {
  description = "Network Security Group Name"
  type        = string
}

variable "address_space" {
  description = "VNet Address Space"
  type        = list(string)
}

variable "subnet_prefix" {
  description = "Subnet Address Prefix"
  type        = list(string)
}

variable "tags" {
  description = "Common Tags"

  type = map(string)

  default = {
    Environment = "Dev"
    Owner       = "Subhasish"
  }
}