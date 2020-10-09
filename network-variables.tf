#########################
## Network - Variables ##
#########################

variable "kopi-vnet-cidr" {
  type        = string
  description = "The CIDR of the VNET"
}

variable "kopi-gateway-subnet-cidr" {
  type        = string
  description = "The CIDR for the Gateway subnet"
}
