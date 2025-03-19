resource "azurerm_public_ip" "custom_image_vm_pip" {
  name                = var.custom_image_vm_ip_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "custom_image_vm_network_interface" {
  name                = var.custom_image_vm_nic_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.terraform_remote_state.network.outputs.public_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.custom_image_vm_pip.id
  }
}

resource "azurerm_linux_virtual_machine" "custom_image_vm" {
  name                  = var.custom_image_vm_name
  location              = data.azurerm_resource_group.rg.location
  resource_group_name   = data.azurerm_resource_group.rg.name
  network_interface_ids = [
    azurerm_network_interface.custom_image_vm_network_interface.id,
  ]

  size                   = var.custom_image_vm_size
  os_disk {
    name                 = var.custom_image_vm_disk_name
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  
  source_image_id = var.custom_packer_image_id
}
