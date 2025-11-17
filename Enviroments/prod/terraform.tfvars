rgdev = {
  rg1 = {
    name     = "rg6"
    location = "West Europe"
  }

}

vnet_dev = {
  vnet1 = {
    name                = "vnetdev"
    location            = "West Europe"
    resource_group_name = "rg6"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]

    subnet_dev = {
      subnet1 = {
        name             = "subnetfront"
        address_prefixes = ["10.0.1.0/24"]
      }

      subnet2 = {
        name             = "subnetback"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}

dev_ip = {
  ip1 = {
    ipname              = "devip1"
    resource_group_name = "rg6"
    location            = "West Europe"
    allocation_method   = "Static"
  }
  ip2 = {
    ipname              = "devip2"
    resource_group_name = "rg6"
    location            = "West Europe"
    allocation_method   = "Static"
  }
}

dev_vm = {
  vmfrontend = {
    vm_name              = "devfrontvm"
    resource_group_name  = "rg6"
    location             = "West Europe"
    vm_size              = "Standard_F2"
    subnet_name          = "subnetfront"
    virtual_network_name = "vnetdev"
    public_ip_name       = "devip1"
    # key_vault_name       = "key8"
    nic_name             = "nicfront"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }

  }

  vmbackend = {
    vm_name              = "devbackend"
    resource_group_name  = "rg6"
    location             = "West Europe"
    vm_size              = "Standard_F2"
    subnet_name          = "subnetback"
    virtual_network_name = "vnetdev"
    public_ip_name       = "devip2"
    # key_vault_name       = "key8"
    nic_name             = "nicback"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }

  }
}

