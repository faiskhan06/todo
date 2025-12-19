terraform {
  backend "azurerm" {
    resource_group_name  = "fk-rg"
    storage_account_name = "fkstg"
    container_name       = "fkcontainer"
    key                  = "dev.statefile"
  }
}
