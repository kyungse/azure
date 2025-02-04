resource "azurerm_public_ip" "bastion_pip" {
  name                = var.bastion_public_ip_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "bastion_network_interface" {
  name                = var.bastion_nic_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.terraform_remote_state.network.outputs.public_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.bastion_pip.id
  }
}

resource "azurerm_network_security_group" "bastion_security_group" {
  name                = var.bastion_security_group_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  security_rule {
    name                       = "AllowSSH"
    description                = "Allow SSH from any source"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "bastion_ni_sg_association" {
  network_interface_id      = azurerm_network_interface.bastion_network_interface.id
  network_security_group_id = azurerm_network_security_group.bastion_security_group.id
}

resource "azurerm_linux_virtual_machine" "bastion" {
  name                = var.bastion_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  network_interface_ids = [
    azurerm_network_interface.bastion_network_interface.id,
  ]
  size                = var.bastion_size
  admin_username      = var.admin_username
  
  admin_ssh_key {
    username   = var.admin_username
    public_key = azapi_resource_action.ssh_public_key_gen.output.publicKey
  }
  
  os_disk {
    name                 = var.bastion_disk_name
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = data.terraform_remote_state.common.outputs.storage_account_uri
  }
  
  connection {
    type        = "ssh"
    user        = var.admin_username
    private_key = file("~/.ssh/${var.ssh_public_key_name}")
    host        = azurerm_public_ip.bastion_pip.ip_address
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y git net-tools curl wget python3 python3-pip unzip",

      "curl -fsSL https://releases.hashicorp.com/terraform/1.6.0/terraform_1.6.0_linux_amd64.zip -o terraform.zip",
      "sudo unzip terraform.zip -d /usr/local/bin/",
      "rm terraform.zip",
      "terraform --version",

      "curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash",
      "az --version"
    ]
  }
}
