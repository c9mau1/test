locals {
    res_group = "${var.env}-ResGroup"
    region = "japaneast"
    app_service_plan_name = "${var.env}-AppServicePlan"
    app_service_plan_tier = "Free"
    app_service_plan_size = "F1"
    web_app_name = "${var.env}-WebApp-20180827"
}
