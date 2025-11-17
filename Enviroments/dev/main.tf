module "resource_group" {
  source = "../../module/azurerm_resource_group"
  rgdev  = var.rgdev
}


# module "public_ip" {
#   source = "../../module/azurerm _public_ip"
#   dev_ip = var.dev_ip
# }

# module "virtual_network" {
#   source   = "../../module/azurerm_virtual_network"
#   vnet_dev = var.vnet_dev
# }



# module "linux_virtual_machine" {
#   source = "../../module/azurerm_compute"
#   devvm= var.devvm
# }

# module "mssql_server" {
#   source = "../../module/azurerm_sql"
#   sql_dev = var.sql_dev
# }