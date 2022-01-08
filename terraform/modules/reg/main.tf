resource "azurerm_resource_group" "rg"{
    name = "intern-${var.config.name}-${var.config.id}"
    location =  var.config.location
    tags = {
        customer = var.config.customer
        id = var.config.id
    }
}
