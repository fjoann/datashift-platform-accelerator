terraform {
  backend "azurerm" {
    resource_group_name = "datashift-platform-accelerator-terraform"
    storage_account_name = "platformaccterraform0p9u"
    container_name = "tfstate"
    key = "terraform.tfstate"
    use_oidc = true
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.79.0"
    }
  }
}

provider "azurerm" {
  use_oidc = true
  features {}
}

resource "azurerm_resource_group" "this" {
  name     = "datashift-platform-accelerator-${var.environment_name}"
  location = "westeurope"
}
