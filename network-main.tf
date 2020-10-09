####################
## Network - Main ##
####################

# Create a Resource Group
resource "azurerm_resource_group" "kopi-rg" {
  name     = "${var.region}-${var.environment}-${var.app_name}-rg"
  location = var.location
  tags = {
    environment = var.environment
  }
}

# Create the VNET
resource "azurerm_virtual_network" "kopi-vnet" {
  name                = "${var.region}-${var.environment}-${var.app_name}-vnet"
  address_space       = [var.kopi-vnet-cidr]
  location              = azurerm_resource_group.kopi-rg.location
  resource_group_name   = azurerm_resource_group.kopi-rg.name
  tags = {
    environment = var.environment
  }
}

# Create a Gateway Subnet
resource "azurerm_subnet" "kopi-gateway-subnet" {
  name                 = "GatewaySubnet" # do not rename
  address_prefixes     = [var.kopi-gateway-subnet-cidr]
  virtual_network_name = azurerm_virtual_network.kopi-vnet.name
  resource_group_name  = azurerm_resource_group.kopi-rg.name
}
