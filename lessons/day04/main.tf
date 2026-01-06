terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 4.8.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "deb-terraform-azure-rg"  # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "debterraformstorage1"                      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "dev.terraform.tfstate"        # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
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
 
  name                     = "debterraformstorage101"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location # implicit dependency
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}
