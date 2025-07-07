variable "virtual_network_name" {
  description = "The name of the Azure Virtual Network."
  type        = string
}

variable "virtual_network_address_space" {
  description = "The address space for the Azure Virtual Network."
  type        = list(string)
}

variable "virtual_network_location" {
  description = "The Azure Region where the Virtual Network will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group where the Virtual Network will be created."
  type        = string
}

variable "resource_group_location" {
  description = "The Azure Region where the Resource Group is located."
  type        = string
}