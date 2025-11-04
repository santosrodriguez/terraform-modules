variable "storage_account_name" {
    type = string
    validation {
      condition     = length(var.storage_account_name) >= 3 && length(var.storage_account_name) <= 24
      error_message = "The storage account name must be between 3 and 24 characters long."

    }
}

variable "resource_group_name" {
    type = string
}

variable "location" {
  type        = string
  description = "Azure region location"
  validation {
    condition = contains(
      ["eastus", "westus"], var.location
    )
    error_message = "Error: Location is not valid. Valid options are eastus or westus."
  }
  default = "eastus"
}


variable "tags" {
  type = map(string)
  description = "Tags"
  #validation {
  #  condition = contains(keys(var.tags), "environment") && contains(keys(var.tags), "owner")
  #  error_message = "You must provide both 'environment' and 'owner' tags."
  #}
}

variable "account_kind" {
  type = string
  validation {
    condition     = contains(["Storage", "StorageV2", "BlobStorage", "FileStorage", "BlockBlobStorage"], var.account_kind)
    error_message = "Invalid account_kind. Allowed values: Storage, StorageV2, BlobStorage, FileStorage, BlockBlobStorage."
  }
  default = "StorageV2"
}
variable "account_tier" {
  type = string
  description = "Storage account tier."
  default = "Standard"
  validation {
    condition     = contains(["Standard", "Premium"], var.account_tier)
    error_message = "Invalid account_tier. Allowed values: Standard, Premium."
  }
}
variable "account_replication_type" {
  type = string
  description = "Storage account replication type."
  default = "LRS"
  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.account_replication_type)
    error_message = "Invalid account_replication_type. Allowed values: LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS."
  }
}
variable  "https_traffic_only_enabled" {
    type = bool
    default = true
}
variable  "min_tls_version" {
    type = string
    description = "Storage account minimum TLS version."
    default = "TLS1_2"
}
variable  "storage_account_public_network_access_enabled" {
    type = bool
    default = false
}
variable  "private_dns_zone_ids" {
    type = list(string)
    default = ["/subscriptions/56bdaed4-70cf-4a28-8fb8-0efc135bb29f/resourceGroups/rg-azuredns-prd-01/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"]

}
variable  "storage_private_endpoint_subnet_id" {
    type = string
    description = "Storage account private endpoint subnet ID."
}

variable  "private_dns_zone_group_name" {
    type = string
    description = "Specifies the Name of the Private DNS Zone Group."
    default = "default"
}
variable  "subresource_names" {
    type = list(string)
    description = "A list of subresource names which the Private Endpoint is able to connect to."
    default = ["blob"]
}
