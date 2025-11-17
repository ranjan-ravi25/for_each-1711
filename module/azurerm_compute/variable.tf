variable "dev_vm" {
  type = map(object({
    vm_name                = string
    resource_group_name    = string
    location               = string
    vm_size                = string
    subnet_name            = string
    virtual_network_name   = string
    public_ip_name         = string
    key_vault_name         = string
    nic_name               = string
    source_image_reference = map(string)
    script_name            = string
  }))
}


