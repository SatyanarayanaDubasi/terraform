

resource "azurerm_resource_group" "testrg" {
  name     = "testrg"
  location = local.resource_location
}
resource "azurerm_virtual_network" "testvnet" {
  name                = "testvnet"
  location            = local.resource_location
  resource_group_name = azurerm_resource_group.testrg.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name             = "websubnet"
    address_prefixes = [local.subnet_prefix_id[0]]
  }

  subnet {
    name             = "appsubnet"
    address_prefixes = [local.subnet_prefix_id[1]]
  }
}
