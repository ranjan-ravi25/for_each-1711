variable "sql_dev" {
type = map(object({
 sql_name                    = string
  resource_group_name          = string
  location                     = string
  version                      = optional(string)
  key_vault                    = string         
  minimum_tls_version          = optional(string)
}))
}