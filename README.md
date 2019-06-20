# Amido Azure Out of Hours  Terraform module

Terraform module which creates a tagging policy for Microsoft Azure resources pegged to the current subscription for consumption by Azure Automation/reporting functions for cost saving and auditing purposes.

## Example Usage

```hcl
module "azure-outofhours" {
  source = "git::https://github.com/amido/terraform-azure-outofhours.git"
  resource_group_name     = "${var.resource_group_name}"
  resource_group_location = "${var.resource_group_location}"
}
```
## Provisioning Result


TODO: Parameterise admin user creation and outputs

## Terraform version

This has been tested in AzureRM provider version 1.30.0 and Terraform 0.12

## Examples

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

TODO: Establish hook to write this section!

## Outputs

TODO: Establish hook to write this section!

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Tests

TODO: Establish Terraform testing framework


## Authors

Module is maintained by [William Ayerst](https://github.com/williamayerst).

## License

Apache 2 Licensed. See LICENSE for full details.

