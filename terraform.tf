terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~>4.3"
        }
        azuread = {
            source  = "hashicorp/azuread"
            version = "~> 3.4"
        }
    }
}

provider "azurerm" {
    features {}
    subscription_id = "replaceme"
}

provider "azuread" {
    tenant_id = "replaceme"
}