###########################
## Azure Provider - Main ##
###########################

# Define Terraform provider
terraform {
  required_version = ">= 0.13"
}

# Configure the Azure provider
provider "azurerm" {
  environment = "public"
  version     = ">= 2.7.0"
  features {}
  subscription_id = var.azure-subscription-id
  client_id       = var.azure-client-id
  client_secret   = var.azure-client-secret
  tenant_id       = var.azure-tenant-id
}
