resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "public_subnet" {
  name                 = var.public_subnet_name
  resource_group_name  =data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.public_subnet_cidr_blocks
}

resource "azurerm_subnet" "private_subnet" {
  name                 = var.private_subnet_name
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.private_subnet_cidr_blocks
}

resource "azurerm_nat_gateway" "nat_gateway" {
  name                = var.nat_gateway_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku_name            = "Standard"
}

resource "azurerm_public_ip" "nat_public_ip" {
  name                = var.nat_public_ip_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_nat_gateway_public_ip_association" "nat_gateway_association" {
  nat_gateway_id         = azurerm_nat_gateway.nat_gateway.id
  public_ip_address_id   = azurerm_public_ip.nat_public_ip.id
}

resource "azurerm_subnet_nat_gateway_association" "private_subnet_nat_association" {
  subnet_id      = azurerm_subnet.private_subnet.id
  nat_gateway_id = azurerm_nat_gateway.nat_gateway.id
}

resource "azurerm_network_security_group" "private_subnet_nsg" {
  name                = var.private_subnet_nsg_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.terraform_remote_state.common.outputs.resource_group_name
}

resource "azurerm_network_security_rule" "deny_internet_outbound" {
  name                        = "DenyInternetOutbound"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "Internet"
  resource_group_name         = data.terraform_remote_state.common.outputs.resource_group_name
  network_security_group_name = azurerm_network_security_group.private_subnet_nsg.name
}

resource "azurerm_subnet_network_security_group_association" "private_subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.private_subnet.id
  network_security_group_id = azurerm_network_security_group.private_subnet_nsg.id
}
