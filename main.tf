terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "2e22aec5-7840-45c5-a46b-2688971d3451"
}

resource "azurerm_resource_group" "testrg" {
  name     = "testrg"
  location = "West Europe"
}
resource "azurerm_virtual_network" "testvnet" {
  name                = "testvnet"
  location            = "West Europe"
  resource_group_name = "testrg"
  address_space       = ["10.0.0.0/16"]

  subnet {
    name             = "websubnet"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name             = "appsubnet"
    address_prefixes = ["10.0.2.0/24"]
  }
}
