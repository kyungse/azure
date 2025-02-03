# Key for accessing common, network resources
common_tfstate_key          = "common/terraform.tfstate"
network_tfstate_key         = "network/terraform.tfstate"

# Variables for bastion components
bastion_name                = "kyungse-bastion"
bastion_public_ip_name      = "kyungse-bastion-pip"
bastion_security_group_name = "kyungse-bastion-nsg"
admin_username              = "kyungse"
bastion_size                = "Standard_DS1_v2"
bastion_disk_name           = "kyungse-bastion-disk"
ssh_public_key_name         = "kyungse-ssh-public-key"
bastion_nic_name            = "kyungse-bastion-nic"
