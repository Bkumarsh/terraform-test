variable "resource_group_name" {
  description = "The name of the resource group"
  default     = ["dev","prod"]
  type        = list(string)
}

resource "azurerm_resource_group" "azure_rg" {
  for_each = toset(var.resource_group_name)
  name     = "resource_group_name${each.value}"
  location = "East US"
}

# resource "azurerm_storage_account" "azure_sgc" {
#   name                     = "dhondhustorageaccount"
#   resource_group_name      = azurerm_resource_group.azure_rg.name
#   location                 = azurerm_resource_group.azure_rg.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }