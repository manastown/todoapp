

resource "azurerm_network_interface" "nic" {
  name                = var.network_interface_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pip.id
    }
}
resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.virtual_machine_name
  resource_group_name             = var.resource_group_name
  location                        = var.resource_group_location
  size                            = var.virtual_machine_size
  admin_username                  = var.virtual_admin_username
  admin_password                  = var.virtual_admin_password
  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.nic.id]

  os_disk {
    name                 = var.virtual_machine_os_disk_name
    caching              = var.virtual_machine_os_disk_caching
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
  custom_data = base64encode(<<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    systemctl enable nginx
    systemctl start nginx
    
    EOF
  )
}