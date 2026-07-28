variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "environment" {
  description = "Deployment Environment"
  type        = string

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be either dev or prod."
  }
}

variable "storage_account_count" {
  description = "Number of Storage Accounts"
  type        = number
  default     = 3
}

variable "nsg_names" {
  description = "List of NSGs"

  type = set(string)

  default = [
    "web",
    "app",
    "db"
  ]
}

variable "tags" {
  type = map(string)

  default = {
    Environment = "Dev"
    Owner       = "Subhasish"
  }
}