terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rgprovider5"
    storage_account_name = "stgprov"
    container_name       = "contprov1"
    key                  = "dev.terraform.tfstate"
  }
}


provider "azurerm" {
  features {}
  subscription_id = "e18988e4-e1f4-4f06-9339-c63c8a22d3d9"

}

