resource "azurerm_linux_virtual_machine" "fk_linux_vm" {
  name                            = var.vm_name
  resource_group_name             = var.resource_group_name
  location                        = var.virtual_machine_location
  size                            = "Standard_B2s"
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.mynic.id]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = "latest"
  }
   custom_data = base64encode(file(var.custom_data))
 depends_on = [
    azurerm_network_interface.mynic,
    azurerm_subnet.fk_subnet,
    azurerm_virtual_network.polaris-vnet,
    azurerm_public_ip.fk_public_ip,
    azurerm_network_security_group.nsg
  ]
}
