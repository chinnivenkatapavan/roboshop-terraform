module "database" {
  for_each    = var.database
  source      = "./modules/vm"
  component   = each.value["name"]
  env         = var.env
  token = var.token
  container   = each.value["container"]
}

# module "component" {
#     for_each  = var.component
#     source    = "./modules/vm"
#     component = each.value["name"]
#     env       = var.env
#     token     = var.token
#     container = each.value["container"]
# }

module "aks" {
    source = "./modules/aks"
}