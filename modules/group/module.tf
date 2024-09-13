locals {

  # Pobierz object ID użytkowników na podstawie ich adresów e-mail
  user_ids = [for user in data.azuread_user.user : user.id]

  # Pobierz object ID grup na podstawie ich nazw
  group_ids = [for group in data.azuread_group.group : group.id]

  # Pobierz object ID service principal na podstawie ich nazw
  service_principal_ids = [for spn in data.azuread_service_principal.spn : spn.id]

  # Połącz wszystkie object ID w jedną listę
  all_member_ids = concat(local.user_ids, local.group_ids, local.service_principal_ids)
}



data "azuread_user" "user" {
  for_each = var.users
  user_principal_name = each.key
}

data "azuread_group" "group" {
  for_each = var.groups
  display_name = each.key
}

data "azuread_service_principal" "spn" {
  for_each  = var.spns
  client_id = each.key
}


resource "azuread_group" "group" {

  lifecycle {
    ignore_changes = [
      // The following fields only have an effect on initial provisioning of the group.
      // When importing existing resources, these would trigger a replacement of the imported resource.
      behaviors,
      provisioning_options,
    ]
  }

  display_name = var.display_name
  description  = var.description
  #visibility   = var.visibility
  types        = var.types

  members = local.all_member_ids
//  owners  = var.owners

  mail_enabled  = var.mail_enabled
  mail_nickname = var.mail_nickname

  security_enabled   = var.security_enabled

}
