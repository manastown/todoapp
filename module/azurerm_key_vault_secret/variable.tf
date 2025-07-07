variable "frontend_username_name" {
  
}
variable "frontend_username_value" {
  type = string
}
variable "frontend_password_name" {
  
}
variable "frontend_password_value" {
  type = string
}
variable "key_vault_name" {
  description = "The ID of the Key Vault where the secrets will be stored."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group where the Key Vault is located."
  type        = string
}

