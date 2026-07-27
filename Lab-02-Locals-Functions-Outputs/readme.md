# Lab 02 - Local Values, Variable Interpolation & Terraform Functions

## Objective

Learn how to use local values, variable interpolation, built-in Terraform functions, and output blocks to create cleaner, reusable, and maintainable Terraform code.

---

## Topics Covered

- Variable Interpolation
- Local Values (`locals`)
- Terraform Functions
  - `upper()`
  - `lower()`
  - `title()`
  - `length()`
  - `join()`
  - `split()`
  - `format()`
  - `substr()`
  - `lookup()`
  - `contains()`
- Output Blocks

---

## Folder Structure

```
Lab-02-Locals-Functions-Outputs/
│
├── README.md
├── providers.tf
├── variables.tf
├── locals.tf
├── main.tf
├── outputs.tf
└── terraform.tfvars
```

---

## Resources Deployed

- Azure Resource Group

---

## Terraform Commands Used

```bash
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
```

---

## Key Concepts

### Variable Interpolation

Combines multiple variables to create dynamic values.

Example:

```hcl
"${var.project_name}-${var.environment}-rg"
```

Output:

```
terraform-dev-rg
```

---

### Local Values

Local values simplify code by storing reusable expressions.

Example:

```hcl
locals {
  rg_name = "${var.project_name}-${var.environment}-rg"
}
```

---

### Terraform Functions

This lab demonstrates the following functions:

| Function | Purpose |
|----------|---------|
| `upper()` | Converts text to uppercase |
| `lower()` | Converts text to lowercase |
| `title()` | Capitalizes the first letter of each word |
| `length()` | Returns the length of a string |
| `join()` | Joins multiple strings |
| `split()` | Splits a string into a list |
| `format()` | Formats a string |
| `substr()` | Returns part of a string |
| `lookup()` | Retrieves a value from a map |
| `contains()` | Checks if a list contains a value |

---

## Learning Outcome

After completing this lab, I learned how to:

- Create reusable local values.
- Use variable interpolation.
- Apply commonly used Terraform functions.
- Display values using output blocks.
- Generate dynamic resource names using variables and locals.

---