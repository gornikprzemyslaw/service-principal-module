locals {
  spns_yaml = yamldecode(file("${path.module}/data/service_principals.yaml"))

  default_tags = {
    costcenter  = "shared"
    environment = "prod"
    constructor = "terraform"
  }
}
