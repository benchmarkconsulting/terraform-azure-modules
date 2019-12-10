resource "azurerm_resource_group" "demo" {
  name     = "${var.prefix}-resources"
  location = "${var.location}"
}

resource "azurerm_virtual_network" "demo" {
  name                = "${var.prefix}-network"
  resource_group_name = "${azurerm_resource_group.demo.name}"
  location            = "${azurerm_resource_group.demo.location}"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  virtual_network_name = "${azurerm_virtual_network.demo.name}"
  resource_group_name  = "azurerm_resource_group.demo.name"
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  virtual_network_name = "${azurerm_virtual_network.demo.name}"
  resource_group_name  = "${azurerm_resource_group.demo.name}"
  address_prefix       = "10.0.2.0/24"
}