resource_group_name = "rg-meta-lab"

location = "Central India"

environment = "dev"

storage_account_count = 3

nsg_names = [
  "web",
  "app",
  "db"
]

tags = {
  Environment = "Dev"
  Owner       = "Subhasish"
}