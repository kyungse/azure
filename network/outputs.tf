output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = azurerm_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = azurerm_subnet.private_subnet.id
}
output "nat_gateway_id" {
  description = "The ID of the NAT gateway"
  value       = azurerm_nat_gateway.nat_gateway.id
}

output "nat_public_ip_id" {
  description = "The ID of the NAT public IP"
  value       = azurerm_public_ip.nat_public_ip.id
}

output "nat_public_ip_address" {
  description = "The public IP address of the NAT gateway"
  value       = azurerm_public_ip.nat_public_ip.ip_address
}

output "private_subnet_nsg_id" {
  description = "The ID of the network security group for the private subnet"
  value       = azurerm_network_security_group.private_subnet_nsg.id
}
