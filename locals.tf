locals {
  resource_location = "West Europe"
  virtual_network = {
    name             = "testvnet"
    address_prefixes = ["10.0.0.0/16"]
  }
  subnet_prefix_id = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnets = [
    {
      name             = "websubnet"
      address_prefixes = ["10.0.0.0/24"]
    },
    {
      name             = "appsubnet"
      address_prefixes = ["10.0.1.0/24"]
    },
    {
      name             = "devsubnet"
      address_prefixes = ["10.0.2.0/24"]
    },
    {
      name             = "prodsubnet"
      address_prefixes = ["10.0.3.0/24"]
    }
  ]
}

