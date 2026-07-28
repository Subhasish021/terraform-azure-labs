locals {

  # Variable Interpolation
  final_nsg_name = "${var.nsg_name}-${lower(var.tags["Environment"])}"

}