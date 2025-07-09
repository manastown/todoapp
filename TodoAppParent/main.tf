module "resource_group" {
  source = "../module/azurerm_resource_group"

  azurerm_resource_group_name     = "TodoAppResourceGroup"
  azurerm_resource_group_location = "canada central"
}
module "resource_group" {
  source = "../module/azurerm_resource_group"

  azurerm_resource_group_name     = "prabhatresource"
  azurerm_resource_group_location = "westus"
}
module "resource_group" {
  source = "../module/azurerm_resource_group"

  azurerm_resource_group_name     = "prabhatrg"
  azurerm_resource_group_location = "westus"
}




module "virtual_network" {
  depends_on = [module.resource_group]
  source = "../module/azurerm_virtual_network"
  
  virtual_network_name         = "TodoAppVNet"
  virtual_network_address_space = ["10.0.0.0/16"]
  virtual_network_location     = "canada central"

  resource_group_name          = "todoappresourcegroup" # ye correct hona chahiye, not azurerm_resource_group_name
  resource_group_location      = "canada central"# ye correct hona chahiye, not azurerm_resource_group_location
}
# module "frontendsubnet" {
#   depends_on = [module.virtual_network]
#   source = "../module/azurerm_subnet"

#   subnet_name            = "FrontendSubnet"
#   virtual_network_name   = "TodoAppVNet"       # ye correct hona chahiye, not azurerm_virtual_network_name
#   resource_group_name    = "TodoAppResourceGroup" # ye correct hona chahiye, not azurerm_resource_group_name
# subnet_address_prefixes = ["10.0.1.0/24"]
# }



module "frontendsubnet" {
  depends_on = [module.virtual_network]
  source = "../module/azurerm_subnet"

  subnet_name            = "BackendSubnet"
  virtual_network_name   = "TodoAppVNet"         # ye correct hona chahiye, not azurerm_virtual_network_name
  resource_group_name    = "TodoAppResourceGroup" 
  subnet_address_prefixes = ["10.0.2.0/24"]

}

# module "public_ip_frontend" {
#   source                     = "../module/azuerrm_ip_address"
#   azurerm_public_ip_name     = "frontend_TodoAppPublicIP"
#   resource_group_name        = "TodoAppResourceGroup"
#   location                   = "canada central"
#   allocation_method          = "Static"
# }

# module "public_ip_Backend" {
#   source                 = "../module/azuerrm_ip_address"
#   azurerm_public_ip_name = "Backend_TodoAppPublicIP"
#   resource_group_name    = "TodoAppResourceGroup"
#   location               = "canada central"
#   allocation_method      = "Static"
# }

# module "sql_server" {
#   source = "../module/azurerm_sql_server"

#   sql_server_name                = "nimmiserversql"
#   resource_group_name            = "TodoAppResourceGroup"
#   resource_group_location        = "canada central"
#   administrator_login            = "sqladmin"
#   administrator_login_password   = "P@ssw0rd1234!"
# }


# module "sql_database" {
#   depends_on = [module.sql_server]
#   source = "../module/azurerm_sql_database"

#   sql_server_id                  ="/subscriptions/1ecb1540-18db-4ab8-9eac-659a71d4a5f7/resourceGroups/TodoAppResourceGroup/providers/Microsoft.Sql/servers/nimmiserversql"
#   sql_database_name              = "TodoAppDatabase"
# }

  

# module "virtual_machine_frontend" {
#   depends_on = [module.frontendsubnet, module.public_ip_frontend]
#   source                      = "../module/azurerm_virtual_machine"
#   resource_group_name         = "TodoAppResourceGroup"
#   resource_group_location     = "canada central"
#   virtual_machine_name        = "FrontendVM"
#   virtual_machine_size        = "Standard_B1s"
#   virtual_machine_os_disk_name    = "FrontendOSDisk"
#   virtual_machine_os_disk_caching = "ReadWrite"
#   image_publisher             = "Canonical"
#   image_offer                 = "0001-com-ubuntu-server-jammy"
#   image_sku                   = "22_04-lts-gen2"
#   image_version               = "latest"
#   network_interface_name      = "FrontendNIC"
#   location                    = "canada central"
#   subnet_name                 = "FrontendSubnet"
#   pip_name                    = "frontend_TodoAppPublicIP"
#   virtual_network_name        = "TodoAppVNet"
#   virtual_admin_username = "azureuser"
#   virtual_admin_password = "P@ssw0rd1234!"
# }


#   module "virtual_machine_Backend" {
#   depends_on = [module.backendsubnet,module.public_ip_Backend]
#   source = "../module/azurerm_virtual_machine"

#   resource_group_name             = "TodoAppResourceGroup"
#   resource_group_location         = "canada central"
#   virtual_machine_name            = "BackendVM"
#   virtual_machine_size            = "Standard_B1s"
#   virtual_admin_username          = "azureuser"
#   virtual_admin_password          ="P@ssw0rd1234!"
#   virtual_machine_os_disk_name    = "BackendOSDisk"
#   virtual_machine_os_disk_caching = "ReadWrite"
#   image_publisher                 = "Canonical"
#   image_offer                     = "0001-com-ubuntu-server-jammy"
#   image_sku                       = "22_04-lts-gen2"
#   image_version                   = "latest"
#   network_interface_name          = "BackendNIC"
#   location                        = "canada central"
#   subnet_name                     = "BackendSubnet" # ye correct hona chahiye, not azurerm_subnet_name
#   pip_name                        = "Backend_TodoAppPublicIP" # ye correct hona chahiye, not azurerm_public_ip_name
# virtual_network_name              = "TodoAppVNet"
# }

# module "key_vault" {
#   source = "../module/azurerm_key_vault"

#   key_vault_name                = "devopskakhajana"
#   resource_group_name           = "TodoAppResourceGroup"
#   resource_group_location       = "canada central"
# }

# module "Frontend_vm_username" {
#   depends_on = [module.key_vault]
#   source = "../module/azurerm_key_vault_secret"

#   key_vault_name         = "devopskakhajana"
#   resource_group_name    = "TodoAppResourceGroup"

#   frontend_username_name = "frontend-admin-username"
#   frontend_username_value = "azureuser"

#   frontend_password_name  = "frontend-admin-password"
#   frontend_password_value = "P@ssw0rd123!"   # Use a real password or get from var/secret
# }



