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
    subscription_id = var.subscription_id
}

provider "azuread" {
    tenant_id = var.tenant_id
}