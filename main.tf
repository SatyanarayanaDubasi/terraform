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

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "West Europe"
}

resource "azurerm_storage_account" "storage020815" {
  name                     = "storage020815"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}
resource "azurerm_storage_container" "bbcontainer" {
  name               = "bbcontainer"
  storage_account_id = azurerm_storage_account.storage020815.id
}

resource "azurerm_storage_blob" "bbcontainer" {
  name                   = "url_list"
  storage_account_name   = "storage020815"
  storage_container_name = "bbcontainer"
  type                   = "Block"
  source                 = "url_list.txt"
}
