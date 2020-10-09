#############################
# Azure Key Vault variables #
#############################

variable "kv-full-object-id" {
  type        = string
  description = "The object ID of a user, service principal or security group in the Azure Active Directory tenant for FULL access to the Azure Key Vault"
}

variable "kv-sku-name" {
  type        = string
  description = "Select Standard or Premium SKU"
  default     = "standard"
}

variable "kv-enabled-for-deployment" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = "true"
}

variable "kv-enabled-for-disk-encryption" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys" 
  default     = "true"
}

variable "kv-enabled-for-template-deployment" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = "true"
}

variable "kv-key-permissions-full" {
  type        = list(string)
  description = "List of full key permissions, must be one or more from the following: backup, create, decrypt, delete, encrypt, get, import, list, purge, recover, restore, sign, unwrapKey, update, verify and wrapKey."
  default     = [ "backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", 
                  "recover", "restore", "sign", "unwrapKey","update", "verify", "wrapKey" ]
}

variable "kv-secret-permissions-full" {
  type        = list(string)
  description = "List of full secret permissions, must be one or more from the following: backup, delete, get, list, purge, recover, restore and set"
  default     = [ "backup", "delete", "get", "list", "purge", "recover", "restore", "set" ]
} 

variable "kv-certificate-permissions-full" {
  type        = list(string)
  description = "List of full certificate permissions, must be one or more from the following: backup, create, delete, deleteissuers, get, getissuers, import, list, listissuers, managecontacts, manageissuers, purge, recover, restore, setissuers and update"
  default     = [ "create", "delete", "deleteissuers", "get", "getissuers", "import", "list", "listissuers", 
                  "managecontacts", "manageissuers", "purge", "recover", "setissuers", "update", "backup", "restore" ]
}

variable "kv-storage-permissions-full" {
  type        = list(string)
  description = "List of full storage permissions, must be one or more from the following: backup, delete, deletesas, get, getsas, list, listsas, purge, recover, regeneratekey, restore, set, setsas and update"
  default     = [ "backup", "delete", "deletesas", "get", "getsas", "list", "listsas", 
                  "purge", "recover", "regeneratekey", "restore", "set", "setsas", "update" ]
}
