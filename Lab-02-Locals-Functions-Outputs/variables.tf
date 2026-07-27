variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Environment Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "Central India"
}

variable "tags" {
  description = "Resource Tags"

  type = map(string)

  default = {
    Environment = "Dev"
    Owner       = "Subhasish"
  }
}