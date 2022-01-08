resource "azurerm_app_service" "name" {
  name  = "intern-${var.config.name}-${var.config.id}"
  location = var.config.location
  resource_group_name = var.config.resource_group_name
  app_service_plan_id = var.config.app_service_plan_id
  https_only = var.config.https_only
  use_32_bit_worker_process = var.config.use_32_bit_worker_process
  site_config {
      linux_fx_version = var.config.linux_fx_version 
  }
  app_settings = var.config.app_settings
   

}