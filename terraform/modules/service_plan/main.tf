resource "azurerm_app_service_plan" "asvp" {
  name = "intern-${var.config.name}-${var.config.id}"
  location = var.config.location
  resource_group_name = var.config.resource_group_name
  kind = var.config.kind
  reserved = var.config.reserved
  sku {
    tier = var.config.tier
    size = var.config.size
  }
}