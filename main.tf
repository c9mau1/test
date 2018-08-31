variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "env" {}

provider "azurerm" {
        subscription_id = "${var.subscription_id}"
        client_id = "${var.client_id}"
        client_secret = "${var.client_secret}"
        tenant_id = "${var.tenant_id}"
}


### Resource Group
resource "azurerm_resource_group" "rg" {
        name = "${local.res_group}"
        location = "${local.region}"
        tags = {
                environment = "${var.env}"
        }
}

### App Service Plan
resource "azurerm_app_service_plan" "app_srv_plan" {
        name = "${local.app_service_plan_name}"
        location = "${local.region}"
        resource_group_name = "${local.res_group}"
        kind = "Windows"
        sku {
                tier = "${local.app_service_plan_tier}"
                size = "${local.app_service_plan_size}"
        }
        tags = {
                environment = "${var.env}"
        }
}

### Web App
resource "azurerm_app_service" "web_app" {
        name = "${local.web_app_name}"
        location = "${local.region}"
        resource_group_name = "${local.res_group}"
        app_service_plan_id = "${azurerm_app_service_plan.app_srv_plan.id}"
        tags = {
                environment = "${var.env}"
        }
}

### Storage Account


### Cosmos DB


