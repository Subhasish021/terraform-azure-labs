####################################################
# String Variable
####################################################

variable "resource_group_name" {

  description = "Resource Group Name"

  type = string

  validation {

    condition = length(var.resource_group_name) > 3

    error_message = "Resource Group name must be more than 3 characters."

  }

}

####################################################
# Number Variable
####################################################

variable "vm_count" {

  description = "Number of Virtual Machines"

  type = number

  default = 2

}

####################################################
# Boolean Variable
####################################################

variable "enable_backup" {

  description = "Enable Backup"

  type = bool

  default = true

}

####################################################
# List Variable
####################################################

variable "subnets" {

  description = "Subnet Names"

  type = list(string)

  default = [
    "frontend",
    "backend",
    "database"
  ]

}

####################################################
# Map Variable
####################################################

variable "tags" {

  description = "Azure Tags"

  type = map(string)

  default = {

    Environment = "Dev"

    Owner = "Subhasish"

  }

}

####################################################
# Sensitive Variable
####################################################

variable "admin_password" {

  description = "VM Password"

  type = string

  sensitive = true

}

####################################################
# Nullable Variable
####################################################

variable "location" {

  description = "Azure Region"

  type = string

  nullable = false

  default = "Central India"

}