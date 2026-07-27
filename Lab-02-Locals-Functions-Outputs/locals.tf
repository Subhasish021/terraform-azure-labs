locals {

  # Variable Interpolation
  rg_name = "${var.project_name}-${var.environment}-rg"

  # Functions
  rg_name_upper = upper(local.rg_name)

  rg_name_lower = lower(local.rg_name)

  project_title = title(var.project_name)

  project_length = length(var.project_name)

  joined_name = join("-", [var.project_name, var.environment, "terraform"])

  split_name = split("-", local.rg_name)

  formatted_name = format("%s-%s", var.project_name, var.environment)

  first_four_chars = substr(var.project_name, 0, 4)

}