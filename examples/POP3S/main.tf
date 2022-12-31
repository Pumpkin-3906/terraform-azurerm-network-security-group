resource "azurerm_resource_group" "nsg_rg" {
  location = var.location
  name     = var.resource_group_name
}

module "nsg" {
  source              = "../../"
  resource_group_name = azurerm_resource_group.nsg_rg.name

  security_group_name = var.security_group_name

  predefined_rules = [
    {
      name = "POP3S"
    },
  ]

  custom_rules               = var.custom_rules
  source_address_prefix      = var.source_address_prefix
  destination_address_prefix = var.destination_address_prefix
  tags                       = var.tags

  depends_on = [azurerm_resource_group.nsg_rg]
}