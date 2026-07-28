# Lab 03 - Terraform Data Sources

## Objective

Learn how to use Terraform Data Sources to reference existing Azure resources and deploy new resources using information retrieved from those existing resources.

---

## Scenario

An existing Azure Resource Group has already been created by another team.

Instead of creating a new Resource Group, Terraform uses a Data Source to retrieve its details and then deploys a new Network Security Group (NSG) inside it.

---

## Topics Covered

- Terraform Data Sources
- Data Source References
- Resource Block
- Variable Interpolation
- Local Values
- Implicit Dependency
- Output Blocks

---

## Folder Structure

```
Lab-03-Data-Sources
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

## Resources Used

### Existing Resource

- Azure Resource Group (Referenced using a Data Source)

### New Resource Created

- Azure Network Security Group (NSG)

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

### Data Source

A Data Source allows Terraform to retrieve information about existing infrastructure without creating or modifying it.

Example:

```hcl
data "azurerm_resource_group" "existing_rg" {
  name = var.resource_group_name
}
```

---

### Data Source Reference

Data retrieved from a Data Source can be referenced using the following syntax:

```hcl
data.<provider>.<resource_type>.<resource_name>.<attribute>
```

Example:

```hcl
data.azurerm_resource_group.existing_rg.location
```

---

### Resource Block

Terraform uses the information retrieved from the Data Source to create a new resource.

Example:

```hcl
resource "azurerm_network_security_group" "nsg" {
  name                = local.final_nsg_name
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name
}
```

---

### Implicit Dependency

The Network Security Group automatically depends on the Data Source because it references its attributes.

No explicit `depends_on` is required.

---

## Learning Outcome

After completing this lab, I learned how to:

- Retrieve existing Azure resources using Terraform Data Sources.
- Reference attributes from existing infrastructure.
- Deploy new resources using Data Source values.
- Understand the difference between a Resource Block and a Data Source.
- Understand how Terraform automatically creates implicit dependencies.

---

## Key Difference

| Resource Block | Data Source |
|----------------|------------|
| Creates or manages infrastructure | Reads existing infrastructure |
| Uses the `resource` keyword | Uses the `data` keyword |
| Can create, update, and delete resources | Read-only |

---

## Interview Takeaway

**Resource Block**

> Used to create and manage Azure resources.

**Data Source**

> Used to retrieve information about existing Azure resources without managing them.

This distinction is one of the most frequently asked Terraform interview questions.