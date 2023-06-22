# Configure Terraform to set the required AzureRM provider
# version and features{} block

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.54.0"
    }
  }
}

# Define the provider configuration

provider "azurerm" {
  features {}
}

# Get the current client configuration from the AzureRM provider

data "azurerm_client_config" "current" {}

# Connectivity 
module "connectivity" {
  source = "./modules/connectivity"

  root_id                      = var.root_id
  root_name                    = var.root_name
  subscription_id_connectivity = var.subscription_id_connectivity
}

# Management 
module "management" {
  source = "./modules/management"

  root_id                    = var.root_id
  root_name                  = var.root_name
  subscription_id_management = var.subscription_id_management
}

# Identity 
module "identity" {
  source = "./modules/identity"

  root_id                  = var.root_id
  root_name                = var.root_name
  subscription_id_identity = var.subscription_id_identity
}
