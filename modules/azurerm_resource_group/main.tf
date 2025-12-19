resource "azurerm_resource_group" "fkrg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}
