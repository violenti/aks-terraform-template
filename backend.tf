terraform {

  backend "azurerm" {

    subscription_id = ""

    resource_group_name = "RG-example"

    storage_account_name = "example_storage"

  }

}