//module "service_principal" {
//  for_each         = { for spn in local.spns_yaml : spn.identity_name => spn }
//  source           = "./modules/service-principal"
//  identity_name    = each.value.identity_name
//  repository_name  = each.value.repository_name
//  entity_type      = each.value.entity_type
//  environment_name = lookup(each.value, "environment_name", null)
//  ref_branch       = lookup(each.value, "ref_branch", null)
//  ref_tag          = lookup(each.value, "ref_tag", null)
//  assignments      = lookup(each.value, "assignments", null)
//  tags             = local.default_tags
//
//
//}

//module "group" {
//  for_each         = { for group in local.groups_yaml : group.display_name => group }
//  source           = "./modules/group"
//  display_name     = each.value.display_name
//  description      = each.value.description
//  security_enabled = (each.value.group_type == "security")
//  mail_enabled     = (each.value.group_type == "mail")
//  mail_nickname    = each.value.group_type == "security" ? null : "test"
//  users            = lookup(each.value, "users", [])
//  groups           = lookup(each.value, "groups", [])
//  spns             = lookup(each.value, "spns", [])
//  types            = each.value.group_type == "security" ? null : ["Unified"]
//  tags             = local.default_tags
//
//}

module "user" {
  for_each            = { for user in local.users_yaml : user.display_name => user }
  source              = "./modules/user"
  first_name          = each.value.first_name
  last_name           = each.value.last_name
  display_name        = each.value.display_name
  mail_nickname       = each.value.mail_nickname
  password            = each.value.password
  tags                = local.default_tags

}
