resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "public_subnet" {
  name                            = var.public_subnet_name
  resource_group_name             = data.azurerm_resource_group.rg.name
  virtual_network_name            = azurerm_virtual_network.vnet.name
  address_prefixes                = var.public_subnet_cidr_blocks
  default_outbound_access_enabled = true
}

resource "azurerm_subnet" "private_subnet" {
  name                            = var.private_subnet_name
  resource_group_name             = data.azurerm_resource_group.rg.name
  virtual_network_name            = azurerm_virtual_network.vnet.name
  address_prefixes                = var.private_subnet_cidr_blocks
  default_outbound_access_enabled = false
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

resource "azurerm_route_table" "nat_route_table" {
  name                = "nat-route-table"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_route" "nat_route" {
  name                   = "nat-internet-route"
  resource_group_name    = data.azurerm_resource_group.rg.name
  route_table_name       = azurerm_route_table.nat_route_table.name
  address_prefix         = "0.0.0.0/0"
  next_hop_type          = "Internet"
}

resource "azurerm_subnet_route_table_association" "nat_association" {
  subnet_id      = azurerm_subnet.private_subnet.id
  route_table_id = azurerm_route_table.nat_route_table.id
}
