locals {
  imported_users_yaml  = yamldecode(file("${path.module}/data/imported_users.yaml"))
  imported_groups_yaml = yamldecode(file("${path.module}/data/imported_groups.yaml"))
  imported_spns_yaml   = yamldecode(file("${path.module}/data/imported_service_principals.yaml"))

  spns_yaml   = yamldecode(file("${path.module}/data/service_principals.yaml"))
  groups_yaml = yamldecode(file("${path.module}/data/groups.yaml"))
  users_yaml = yamldecode(file("${path.module}/data/users.yaml"))

  default_tags = {
    costcenter  = "shared"
    environment = "prod"
    constructor = "terraform"
  }
}
