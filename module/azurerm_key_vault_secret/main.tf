resource "azurerm_key_vault_secret" "username" {
  name         = var.frontend_username_name
  value        = var.frontend_username_value
  key_vault_id = data.azurerm_key_vault.key_vault.id
  
}
resource "azurerm_key_vault_secret" "password" {
  name         = var.frontend_password_name
  value        = var.frontend_password_value
  key_vault_id =  data.azurerm_key_vault.key_vault.id
}


