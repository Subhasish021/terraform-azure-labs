resource_group_name = "rg-dependency-lab"

location = "Central India"

vnet_name = "dev"

subnet_name = "web"

nsg_name = "frontend"

address_space = [
  "10.0.0.0/16"
]

subnet_prefix = [
  "10.0.1.0/24"
]

tags = {
  Environment = "Dev"
  Owner       = "Subhasish"
}