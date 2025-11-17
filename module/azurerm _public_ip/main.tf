resource "azurerm_public_ip" "pip" {
  for_each            = var.dev_ip
  name                = each.value.ipname
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
}