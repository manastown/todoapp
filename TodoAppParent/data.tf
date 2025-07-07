
# data "azurerm_key_vault" "key_vault" {
#   name                = "devopskakhajana"
#   resource_group_name = "TodoAppResourceGroup"
# }
# data "azurerm_key_vault_secret" "frontend_admin_password" {
#   name         = "frontend-admin-password"
#   key_vault_id = data.azurerm_key_vault.key_vault.id
# }
# data "azurerm_key_vault_secret" "frontend_admin_username" {
#   name         = "frontend-admin-username"
#   key_vault_id = data.azurerm_key_vault.key_vault.id
# }


# # data "azurerm_key_vault_secret" "Backend_admin_password" {
# #   name         = "Backend-admin-password"
# #   key_vault_id = data.azurerm_key_vault.key_vault.id
# # }
# # data "azurerm_key_vault_secret" "Backend_admin_username" {
# #   name         = "Backend-admin-username"
# #   key_vault_id = data.azurerm_key_vault.key_vault.id
# # }


