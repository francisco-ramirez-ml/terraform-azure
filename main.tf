resource "azurerm_resource_group" "ci_cd_azure" {
  name = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "ci_cd_azure" {
  name                     = "cicd0azure"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "ci_cd_azure" {
  name                  = "${var.resource_group_name}-container"
  storage_account_name  = azurerm_storage_account.ci_cd_az_state.name
  container_access_type = "private"
}
