variable "resource_group_name" {
  description = "Existing Azure Resource Group"
  type        = string
}

variable "nsg_name" {
  description = "Network Security Group Name"
  type        = string
}

variable "tags" {
  description = "Tags for the Network Security Group"

  type = map(string)

  default = {
    Environment = "Dev"
    Owner       = "Subhasish"
  }
}