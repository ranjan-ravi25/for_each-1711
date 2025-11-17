variable "dev_ip" {
  type = map(object({
    ipname              = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    }
  ))


}