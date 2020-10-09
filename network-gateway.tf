########################
## VPN Gateway - Main ##
########################

# Read Certificate
data "azurerm_key_vault_secret" "vpn-root-certificate" {
  depends_on=[azurerm_key_vault.kopi-keyvault]
  
  name         = "vpn-root-certificate"
  key_vault_id = azurerm_key_vault.kopi-keyvault.id
}

# Create a Public IP for the Gateway
resource "azurerm_public_ip" "kopi-gateway-ip" {
  name                = "${var.region}-${var.environment}-${var.app_name}-gw-ip"
  location            = azurerm_resource_group.kopi-rg.location
  resource_group_name = azurerm_resource_group.kopi-rg.name
  allocation_method   = "Dynamic"
}

# Create VPN Gateway
resource "azurerm_virtual_network_gateway" "kopi-vpn-gateway" {
  name                = "${var.region}-${var.environment}-${var.app_name}-gw"
  location            = azurerm_resource_group.kopi-rg.location
  resource_group_name = azurerm_resource_group.kopi-rg.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "Basic"

  ip_configuration {
    name                          = "${var.region}-${var.environment}-${var.app_name}-vnet"
    public_ip_address_id          = azurerm_public_ip.kopi-gateway-ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.kopi-gateway-subnet.id
  }

  vpn_client_configuration {
    address_space = ["10.2.0.0/24"]

    root_certificate {
      name = "VPNROOT"

      public_cert_data = data.azurerm_key_vault_secret.vpn-root-certificate.value
    }

  }
}
