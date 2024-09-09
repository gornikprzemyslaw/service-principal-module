module "service_principal" {
  for_each         = { for spn in local.spns_yaml : spn.identity_name => spn }
  source           = "./modules/service-principal"
  identity_name    = each.value.identity_name
  repository_name  = each.value.repository_name
  entity_type      = each.value.entity_type
  environment_name = lookup(each.value, "environment_name", null)
  ref_branch       = lookup(each.value, "ref_branch", null)
  ref_tag          = lookup(each.value, "ref_tag", null)
  assignments      = lookup(each.value, "assignments", null)
  tags             = local.default_tags


}
