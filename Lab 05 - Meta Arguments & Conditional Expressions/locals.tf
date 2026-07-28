#######################################################
# Local Values
#######################################################

locals {

  # Storage Account Prefix
  storage_prefix = "stlab"

  # Common Name Prefix
  resource_prefix = "${var.environment}-lab"

  # Recovery Services Vault Name
  recovery_vault_name = "${var.environment}-rsv"

}