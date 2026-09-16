terraform {
    required_version = ">= 1.7.0"
    required_providers {
        azurerm = { source = "hashicorp/azurerm", version = "~> 4.0" }
        azuread = { source = "hashicorp/azuread", version = "~> 3.0" }
    }
}

provider "azurerm" {
    features {}
    subscription_id = "92aa7d1b-8adb-4f8f-b545-642ab176218f"
}
provider "azuread" {}

data "azurerm_client_config" "current" {}
data "azuread_client_config" "current" {}
