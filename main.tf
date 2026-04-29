

resource "azurerm_resource_group" "testrg" {
  name     = "testrg"
  location = local.resource_location
}
resource "azurerm_virtual_network" "testvnet" {
  name                = local.virtual_network.name
  location            = local.resource_location
  resource_group_name = azurerm_resource_group.testrg.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name             = local.subnets[0].name
    address_prefixes = local.subnets[0].address_prefixes
  }

  subnet {
    name             = local.subnets[1].name
    address_prefixes = local.subnets[1].address_prefixes
  }
}

resource "azurerm_subnet" "devsubnet" {
  name                 = local.subnets[2].name
  resource_group_name  = azurerm_resource_group.testrg.name
  virtual_network_name = local.virtual_network.name
  address_prefixes     = local.subnets[2].address_prefixes
}

resource "azurerm_subnet" "prodsubnet" {
  name                 = local.subnets[3].name
  resource_group_name  = azurerm_resource_group.testrg.name
  virtual_network_name = local.virtual_network.name
  address_prefixes     = local.subnets[3].address_prefixes
}

