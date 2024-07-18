

resource "azurerm_key_vault_access_policy" "keyvault_policy_cms" {
  key_vault_id = data.azurerm_key_vault.vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_linux_function_app.fa.identity[0].principal_id
  secret_permissions = [
    "Get"
  ]
  certificate_permissions = [
    "Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Recover", "Restore", "SetIssuers", "Update"
  ]

}

/*
resource "azurerm_role_assignment" "kv" {
  scope                = data.azurerm_key_vault.vault.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_linux_function_app.fa.identity[0].principal_id
  depends_on           = [azurerm_linux_function_app.fa]
}

*/

data "azurerm_key_vault_secret" "azure_tenant_id" {
  name         = "azure-tenant-id"
  key_vault_id = data.azurerm_key_vault.vault.id
}

data "azurerm_key_vault_secret" "billing_app_id" {
  name         = "billing-app-id"
  key_vault_id = data.azurerm_key_vault.vault.id
}

data "azurerm_key_vault_secret" "billing_app_secret" {
  name         = "billing-app-secret"
  key_vault_id = data.azurerm_key_vault.vault.id
}

data "azurerm_key_vault_secret" "comm_service_conn_string" {
  name = "comm-service-conn-string"
  # Azure communication services connection string
  key_vault_id = data.azurerm_key_vault.vault.id
}

data "azurerm_key_vault_secret" "cert_name" {
  name         = "cert-name"
  key_vault_id = data.azurerm_key_vault.vault.id
}


