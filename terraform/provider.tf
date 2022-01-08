terraform {
  required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = ">=2.90.0"
      }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.az_subscription
  client_id       = var.az_username
  client_secret   = var.az_password
  tenant_id       = var.az_tenant
}