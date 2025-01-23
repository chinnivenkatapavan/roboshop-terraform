provider "azurerm" {
  features {}
  subscription_id = "b3406e49-0e16-456d-a3bb-c324f1dfb0d5"
}

terraform {
  backend "azurerm" {}
}