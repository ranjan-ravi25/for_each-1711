data "azurerm_key_vault" "kv" {
    for_each = var.sql_dev
  name                = each.value.key_vault
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "username" {
    for_each = var.sql_dev
  name         = "username"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "userpassword" {
    for_each = var.sql_dev
  name         = "userpassword"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}



resource "azurerm_mssql_server" "sql" {
  for_each = var.sql_dev 
  name                         = each.value.sql_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = data.azurerm_key_vault_secret[each.key].username
  administrator_login_password = data.azurerm_key_vault_secret[each.key].userpassword
  minimum_tls_version          = each.value.minimu_tls_version
}