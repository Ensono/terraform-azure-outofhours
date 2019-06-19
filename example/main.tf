provider "azurerm" {}

resource "random_pet" "name" {
  length    = 2
  separator = "-"
  prefix    = "amido-stacks"
}

module "aks-registry" {
  source                  = "git::https://github.com/amido/terraform-azure-outofhours.git"
  resource_group_name     = "${random_pet.name.id}"
  resource_group_location = "${var.resource_group_location}"
}
