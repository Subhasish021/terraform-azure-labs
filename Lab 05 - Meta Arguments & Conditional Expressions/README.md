# Lab 05 - Terraform Meta Arguments & Conditional Expressions

## Objective

Learn how to provision and manage Azure resources efficiently using Terraform Meta Arguments and Conditional Expressions. This lab demonstrates how to create multiple resources with minimal code and control resource creation based on conditions.

---

## Topics Covered

- Meta Arguments
  - `count`
  - `count.index`
  - `for_each`
  - `each.key`
  - `each.value`
  - `lifecycle`
- Conditional Expressions (Ternary Operator)
- Local Values
- Variables
- Outputs
- Resource Creation using AzureRM Provider

---

## Folder Structure

```
Lab-05-Meta-Arguments
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

## Resources Created

- Azure Resource Group
- Azure Storage Accounts (using `count`)
- Azure Network Security Groups (using `for_each`)
- Azure Recovery Services Vault (using Conditional Expression)
- Azure Storage Account with Lifecycle Configuration

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

# Key Concepts

## 1. count

The `count` meta argument is used to create multiple instances of the same resource.

Example:

```hcl
count = var.storage_account_count
```

Terraform creates the number of resources specified by the value of `count`.

---

## 2. count.index

`count.index` represents the index of the current resource being created.

Example:

```hcl
name = "${local.storage_prefix}${count.index}12345"
```

Output:

```
stlab012345
stlab112345
stlab212345
```

---

## 3. for_each

`for_each` creates one resource for every element in a collection.

Example:

```hcl
for_each = var.nsg_names
```

Terraform creates:

- web-nsg
- app-nsg
- db-nsg

---

## 4. each.key & each.value

Inside a `for_each` block:

- `each.key` → Key of the collection
- `each.value` → Value of the collection

Example:

```hcl
name = "${each.value}-nsg"
```

---

## 5. Conditional Expressions

Terraform supports conditional logic using the ternary operator.

Syntax:

```hcl
condition ? true_value : false_value
```

Example:

```hcl
count = var.environment == "prod" ? 1 : 0
```

If the environment is:

- `prod` → Recovery Services Vault is created.
- `dev` → Resource is skipped.

---

## 6. Lifecycle Meta Argument

The `lifecycle` block controls how Terraform manages resources.

Example:

```hcl
lifecycle {

  prevent_destroy = true

  ignore_changes = [
    tags
  ]

}
```

### prevent_destroy

Protects critical resources from accidental deletion.

### ignore_changes

Ignores changes made outside Terraform for selected attributes.

---

## Experiments Performed

### Experiment 1 - count

Changed:

```hcl
storage_account_count = 3
```

to

```hcl
storage_account_count = 5
```

Terraform planned to create two additional Storage Accounts.

---

### Experiment 2 - Conditional Expression

Changed:

```hcl
environment = "dev"
```

to

```hcl
environment = "prod"
```

Terraform planned to create the Recovery Services Vault.

---

### Experiment 3 - for_each

Added a new NSG:

```hcl
"management"
```

Terraform created only the new Network Security Group while leaving the existing resources unchanged.

---

## Learning Outcome

After completing this lab, I learned how to:

- Create multiple resources using `count`.
- Generate unique resource names using `count.index`.
- Create resources dynamically using `for_each`.
- Use `each.key` and `each.value`.
- Create resources conditionally using Terraform Conditional Expressions.
- Protect important resources using the `lifecycle` block.
- Understand the difference between `count` and `for_each`.

---

# Interview Takeaways

### What is a Terraform Meta Argument?

Meta arguments are special arguments that control how Terraform creates and manages resources.

Examples:

- count
- for_each
- lifecycle
- depends_on

---

### count vs for_each

| count | for_each |
|--------|----------|
| Uses numeric indexes | Uses keys or values |
| Best for identical resources | Best for uniquely named resources |
| Resource order matters | Resource names remain stable |

---

### When should you use count?

Use `count` when creating multiple identical resources.

Example:

- Virtual Machines
- Storage Accounts
- Public IPs

---

### When should you use for_each?

Use `for_each` when every resource has a unique identity.

Example:

- NSGs
- Resource Groups
- Users
- Role Assignments

---

### What is a Conditional Expression?

A Conditional Expression allows Terraform to create values or resources based on a condition.

Syntax:

```hcl
condition ? true_value : false_value
```

---

## Conclusion

This lab demonstrated how Terraform Meta Arguments simplify infrastructure provisioning by reducing repetitive code while providing flexibility and control over resource creation. It also introduced Conditional Expressions and Lifecycle rules, which are commonly used in production Terraform deployments.