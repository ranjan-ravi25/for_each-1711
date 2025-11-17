module "resource_group" {
  source = "../module/resource_group"
  rgdev  = var.rgdev
}


module "public_ip" {
  source = "../module/public_ip"
  dev_ip = var.dev_ip
}

module "virtual_network" {
  source   = "../module/vnet"
  vnet_dev = var.vnet_dev
}



module "linux_virtual_machine" {
  source = "../module/vmdev"
  dev_vm = var.dev_vm
}