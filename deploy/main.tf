terraform {
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

variable "environment_name" {
  description = "The name of the environment"
  type        = string
}

resource "azurerm_resource_group" "this" {
  name     = "datashift-platform-accelerator-${var.environment_name}"
  location = "westeurope"
}
