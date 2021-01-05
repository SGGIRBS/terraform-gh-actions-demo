terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    random = {
      source = "hashicorp/random"
    }
  }

  backend "remote" {
    organization = "briggs-corp"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

# Configure the Azure Provider
provider "azurerm" {
  features {}
}

provider "random" {}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}