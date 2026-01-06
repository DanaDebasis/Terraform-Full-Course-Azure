terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 4.8.0"
    }
  }
  required_version = ">=1.9.0"
}

provider "azurerm" {
    features {
      
    }
  subscription_id = "ca62517a-b533-4891-8cb5-db5528753f34"
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  //location = "West Europe"
  location = "Central India"
}

resource "azurerm_storage_account" "example" {
 
  name                     = "debstorageforazure1"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location # implicit dependency
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}
