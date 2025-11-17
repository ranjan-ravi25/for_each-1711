data "azurerm_subnet" "subdata" {
  for_each             = var.dev_vm
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pipdata" {
  for_each            = var.dev_vm
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "kv" {
  for_each            = var.dev_vm
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "vmusername" {
  for_each     = var.dev_vm
  name         = "vmusername"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "vmpassword" {
  for_each     = var.dev_vm
  name         = "vmpassword"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}



resource "azurerm_network_interface" "nic" {
  for_each            = var.dev_vm
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subdata[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pipdata[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each                        = var.dev_vm
  name                            = each.value.vm_name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  custom_data                     = base64encode(file(each.value.script_name))
  size                            = each.value.vm_size
  admin_username                  = data.azurerm_key_vault_secret[each.key].vmusername
  admin_password                  = data.azurerm_key_vault_secret[each.key].vmpassword
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
  ]

  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }
}