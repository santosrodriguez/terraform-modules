# Azure Storage Account Terraform Module

## Introduction
Deploy secure, production-ready Azure Storage Accounts with optional Private Endpoint integration using Terraform.

## Usage

```hcl
module "storage_account" {
  source = "github.com/CareSourceIT/terraform-azurerm-plateng-storage-account"
  storage_account_name = "examplestorageacct"
  resource_group_name  = "example-rg"
  tags = {
    environment = "dev"
    owner       = "team"
  }
  storage_private_endpoint_subnet_id = "<subnet resource id>"
}
```

## Inputs

### Required Inputs

| Name                      | Type           | Description                       |
|---------------------------|----------------|-----------------------------------|
| storage_account_name      | string         | The name of the storage account   |
| resource_group_name       | string         | Resource group name               |
| tags                      | map(string)    | Resource tags                     |
| storage_private_endpoint_subnet_id | string | Private endpoint subnet resource ID |

### Optional Inputs (have defaults)

| Name                                | Type           | Description                                       | Default    |
|--------------------------------------|----------------|---------------------------------------------------|------------|
| location                            | string         | Azure region                                      | "eastus"   |
| account_kind                        | string         | Storage account kind                              | "StorageV2"|
| account_tier                        | string         | Storage account tier                              | "Standard" |
| account_replication_type             | string         | Replication type                                  | "LRS"      |
| https_traffic_only_enabled           | bool           | Force HTTPS                                       | true       |
| min_tls_version                      | string         | Min TLS version                                   | "TLS1_2"   |
| storage_account_public_network_access_enabled | bool | Enable public network access                      | false      |
| private_dns_zone_group_name           | string         | Private DNS zone group name                        | "default"  |
| private_dns_zone_ids                  | list(string)   | List of private DNS zone IDs                      | ["/subscriptions/56bdaed4-70cf-4a28-8fb8-0efc135bb29f/resourceGroups/rg-azuredns-prd-01/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"] |
| subresource_names                     | list(string)   | List of subresource names                         | ["blob"]   |

## Outputs

| Name                                 | Description                           |
|---------------------------------------|---------------------------------------|
| storage_account_id                    | Storage Account resource ID           |
| storage_account_name                  | Storage Account name                  |
| storage_account_primary_access_key    | Storage Account primary access key    |

## Features

- Secure, configurable storage account creation
- Optional Private Endpoint integration
- Tagging support

## Requirements

- Terraform >= 1.4.0
- AzureRM >= 3.0

## Contributing

Feel free to open issues or submit PRs!
