# Key for accessing common, network resources
common_tfstate_key           = "common/terraform.tfstate"
network_tfstate_key          = "network/terraform.tfstate"

# Variables for custom image VM
custom_image_vm_ip_name      = "custom-packer-image-vm-pip"
custom_image_vm_nic_name     = "custom-packer-mage-vm-nic"
custom_image_vm_name         = "custom-packer-image-vm"
custom_image_vm_size         = "Standard_DS2_v2"
custom_image_vm_disk_name    = "custom-packer-image-vm-disk"

# Admin credentials
admin_username               = "kyungse"
admin_password               = "SecureP@ssw0rd!"

# Packer custom image ID
custom_packer_image_id       = "/subscriptions/9348ede3-a18f-4d6d-b67a-2632e0db7787/resourceGroups/kyungse-resource-group/providers/Microsoft.Compute/images/custum-packer-image"
