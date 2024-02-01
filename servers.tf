module "servers" {
  for_each = var.components
  source = "./module"
  component_name = each.value["name"]
  instance_type = each.value["instance_type"]
  provisioner = true
  app_type = "db"
}

module "servers" {
  for_each = var.components
  source = "./module"
  component_name = each.value["name"]
  instance_type = each.value["instance_type"]
  provisioner = true
  app_type = "app"
}