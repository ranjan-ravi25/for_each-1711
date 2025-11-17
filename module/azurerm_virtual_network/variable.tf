variable "vnet_dev" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = list(string)
    subnet_dev = map(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}
