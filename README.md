# Deploying an Azure Point to Site VPN Gateway using Terraform

In this repo, we have a Terraform code that will take care of:

* Create Resource Group
* Create Vnet & Gateway Subnet
* Create Azure KeyVault
* Generate and store VPN Certificate in KeyVault
* Deploy a Virtual Network Gateway using the Certificate stored in Azure KeyVault

Blog --> https://medium.com/@gmusumeci/how-to-deploy-a-vpn-virtual-network-gateway-point-to-site-in-azure-using-terraform-d7202e901afc
