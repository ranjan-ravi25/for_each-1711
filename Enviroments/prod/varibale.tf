variable "rgdev" {
  type = map(object({
    name     = string
    location = string
    }

  ))
}

variable "vnet_dev" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = optional(list(string))
    dns_servers         = optional(list(string))
    subnet_dev = map(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}
variable "dev_ip" {
  type = map(object({
    ipname              = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    }
  ))


}

variable "dev_vm" {
  type = map(object({
    vm_name                = string
    resource_group_name    = string
    location               = string
    vm_size                = string
    subnet_name            = string
    virtual_network_name   = string
    public_ip_name         = string
    # key_vault_name         = string
    nic_name               = string
    source_image_reference = map(string)
  }))
}


