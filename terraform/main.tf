module "reg" {
    source = "./modules/reg"
    depends_on = [
    ]
    config =  {
        "name" = "rg"
        "location" = local.location
        "id" =  local.id
        "customer" = local.customer
    }
}

module "registry" {
  source = "./modules/registry"
  depends_on = [
    module.reg 
  ]
  config = {
      "name" = "acr"
      "id" = local.id
      "location" = local.location
      "sku" = "Basic"
      "admin_enabled" = true 
      "resource_group_name" = module.reg.rg_name
  }
}

module "asv" {
    source = "./modules/asv"
    depends_on = [
      module.reg
    ]
    config = {
        "name" =  "asvp"
        "location" = local.location
        "id" = local.id
        "resource_group_name" = module.reg.rg_name
        "kind" = "Linux"
        "reserved" = true
        "tier" = "Free"
        "size" = "F1"
    }   
}

module "app_service" {
  source = "./modules/app_service"
  depends_on = [
    module.reg,
    module.service_plan,
    module.registry
  ]

  config = {
    "name" =  "aas1"
    "id" =  local.id
    "location" = local.location
    "resource_group_name" = module.reg.rg_name
    "app_service_plan_id" =  module.service_plan.service_plan_id
    "https_only" =  true
    "linux_fx_version"  = "DOCKER|${module.registry.registry_name}.azurecr.io"
    "DOCKER_REGISTRY_SERVER_URL" =  "${module.registry.registry_name}.azurecr.io"
    "use_32_bit_worker_process" =  true
    app_settings = local.env_varibles
  }
  
}