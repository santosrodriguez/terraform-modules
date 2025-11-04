resource "azurerm_storage_account" "storageaccount" {
    name                       = var.storage_account_name
    resource_group_name        = var.resource_group_name
    location                   = var.location
    account_kind               = var.account_kind
    account_tier               = var.account_tier
    account_replication_type   = var.account_replication_type
  
    https_traffic_only_enabled  = var.https_traffic_only_enabled
    min_tls_version            = var.min_tls_version
    public_network_access_enabled =  var.storage_account_public_network_access_enabled
    tags                       = var.tags
    
}

resource "azurerm_private_endpoint" "endpoint" {
  name                = "pe-${azurerm_storage_account.storageaccount.name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = var.storage_private_endpoint_subnet_id
  private_service_connection {
    name                           = "connection-pe-${azurerm_storage_account.storageaccount.name}"
    private_connection_resource_id = azurerm_storage_account.storageaccount.id
    is_manual_connection           = false
    subresource_names              = var.subresource_names
  }
  tags       = var.tags
  depends_on = [azurerm_storage_account.storageaccount]

  private_dns_zone_group {
    name                 = var.private_dns_zone_group_name
    private_dns_zone_ids = var.private_dns_zone_ids

  }
}
