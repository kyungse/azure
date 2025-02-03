# Key for accessing common resources
common_tfstate_key         = "common/terraform.tfstate"

# Variables for network components
vnet_name                  = "kyungse-vnet"
vnet_address_space         = ["10.0.0.0/16"]
public_subnet_name         = "public-subnet"
public_subnet_cidr_blocks  = ["10.0.1.0/24"]
private_subnet_name        = "private-subnet"
private_subnet_cidr_blocks = ["10.0.2.0/24"]
nat_gateway_name           = "kyungse-nat-gateway"
nat_public_ip_name         = "kyungse-nat-public-ip"
private_subnet_nsg_name    = "kyungse-private-subnet-nsg"
