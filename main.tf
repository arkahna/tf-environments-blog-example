terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = join("-", concat(var.naming.prefix, ["rg"], var.naming.suffix))
  location = var.location
}

resource "azurerm_storage_account" "st" {
  name                     = join("", concat(var.naming.prefix, ["st"], var.naming.suffix))
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
