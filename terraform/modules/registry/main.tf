resource "azurerm_container_registry" "acr" {
    name = "intern${var.config.name}${var.config.id}"
    location =  var.config.location
    sku = var.config.sku
    admin_enabled = var.config.admin_enabled
    resource_group_name = var.config.resource_group_name
}