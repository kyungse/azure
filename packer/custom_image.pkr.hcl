source "azure-arm" "custom_image" {
  azure_tags = {
    dept = "Engineering"
    task = "Image deployment"
  }
  client_id                         = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx"
  client_secret                     = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx"
  image_offer                       = "0001-com-ubuntu-server-jammy"
  image_publisher                   = "canonical"
  image_sku                         = "22_04-lts"
  location                          = "koreacentral"
  managed_image_name                = "custum-packer-image"
  managed_image_resource_group_name = "kyungse-resource-group"
  os_type                           = "Linux"
  subscription_id                   = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx"
  tenant_id                         = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx"
  vm_size                           = "Standard_DS2_v2"
}

build {
  sources = ["source.azure-arm.custom_image"]

  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"
    inline          = ["apt-get update", "apt-get upgrade -y", "apt-get -y install nginx", "/usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync"]
    inline_shebang  = "/bin/sh -x"
  }

}
