# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.115.0"
    }
  }

  required_version = ">= 1.5"

  # define terraform cloud targets e.g. organization and workspace
  cloud {}
}

# Define credential details for the provider
provider "azurerm" {
  use_oidc = true
  features {
    app_configuration {
      purge_soft_delete_on_destroy = true
      recover_soft_deleted         = false
    }
  }
  skip_provider_registration = "true"
}

