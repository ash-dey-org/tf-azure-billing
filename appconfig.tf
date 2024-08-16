resource "azurerm_app_configuration" "bill_app_config" {
  name                  = "vsad-${var.env}-${var.proj}-app-config"
  resource_group_name   = data.azurerm_resource_group.rg.name
  location              = data.azurerm_resource_group.rg.location
  sku                   = "standard"
  public_network_access = "Enabled"
}


resource "azurerm_app_configuration_key" "kv_url" {
  configuration_store_id = azurerm_app_configuration.bill_app_config.id
  key                    = "BillingApp:kv_url"
  value                  = data.azurerm_key_vault.vault.vault_uri
  depends_on = [
    azurerm_app_configuration.bill_app_config
  ]
}



resource "azurerm_app_configuration_key" "azure_tenant_id" {
  configuration_store_id = azurerm_app_configuration.bill_app_config.id
  key                    = "BillingApp:azure_tenant_id"
  type                   = "vault"
  vault_key_reference    = data.azurerm_key_vault_secret.azure_tenant_id.versionless_id
  depends_on = [
    azurerm_app_configuration.bill_app_config
  ]
}

resource "azurerm_app_configuration_key" "billing_app_id" {
  configuration_store_id = azurerm_app_configuration.bill_app_config.id
  key                    = "BillingApp:billing_app_id"
  type                   = "vault"
  vault_key_reference    = data.azurerm_key_vault_secret.billing_app_id.versionless_id
  depends_on = [
    azurerm_app_configuration.bill_app_config
  ]
}

resource "azurerm_app_configuration_key" "cert_name" {
  configuration_store_id = azurerm_app_configuration.bill_app_config.id
  key                    = "BillingApp:cert_name"
  type                   = "vault"
  vault_key_reference    = data.azurerm_key_vault_secret.cert_name.versionless_id
  depends_on = [
    azurerm_app_configuration.bill_app_config
  ]
}

resource "azurerm_app_configuration_key" "comm_service_conn_string" {
  configuration_store_id = azurerm_app_configuration.bill_app_config.id
  key                    = "BillingApp:comm_service_conn_string"
  type                   = "vault"
  vault_key_reference    = data.azurerm_key_vault_secret.comm_service_conn_string.versionless_id
  depends_on = [
    azurerm_app_configuration.bill_app_config
  ]
}

resource "azurerm_app_configuration_key" "vendor_subscriptions" {
  configuration_store_id = azurerm_app_configuration.bill_app_config.id
  key                    = "BillingApp:vendor_subscriptions"
  type                   = "vault"
  vault_key_reference    = data.azurerm_key_vault_secret.vendor_subscriptions.versionless_id
  depends_on = [
    azurerm_app_configuration.bill_app_config
  ]
}

