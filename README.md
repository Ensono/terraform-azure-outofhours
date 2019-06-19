# Amido Azure ACR  Terraform module


Terraform module which creates an Azure Container Registry with supporting resources in Azure.

## Example Usage

```hcl
module "aks-registry" {
  source = "git::https://github.com/amido/terraform-azure-acr.git"
  resource_group_name     = "${var.resource_group_name}"
  resource_group_location = "${var.resource_group_location}"
}
```

If you are using classic container registry SKUs, you will need to set the following values:

```hcl
module "aks-registry" {
  source = "git::https://github.com/amido/terraform-azure-acr.git"
  resource_group_name     = "${var.resource_group_name}"
  resource_group_location = "${var.resource_group_location}"
  registry_sku            = "classic"
  registry_sku_is_classic = true
}
```
## Provisioning Result

Without any variables, this module will provision a standard Azure Container Registry in West Europe, returning the login server and primary administrative key as outputs.

TODO: Parameterise admin user creation and outputs

## Terraform version

This has been tested in AzureRM provider version 1.9.0 and Terraform 0.11.7

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

