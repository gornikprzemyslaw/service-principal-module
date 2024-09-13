data "azuread_domains" "default" {
  only_initial = true
}

locals {
  domain_name = data.azuread_domains.default.domains.0.domain_name
}

//resource "azuread_user" "example" {
//  user_principal_name = var.user_principal_name
//  display_name        = var.display_name
//  mail_nickname       = var.mail_nickname
//  password            = var.password
//}

resource "random_pet" "suffix" {
  length = 2
}

resource "azuread_user" "example" {
  user_principal_name = format(
  "%s%s-%s@%s",
  substr(lower(var.first_name), 0, 1),
  lower(var.last_name),
  random_pet.suffix.id,
  local.domain_name
  )

  password = format(
  "%s%s%s!",
  lower(var.last_name),
  substr(lower(var.first_name), 0, 1),
  length(var.first_name)
  )
  force_password_change = true
  display_name        = var.display_name
  #display_name = "${each.value.first_name} ${each.value.last_name}"
  #department   = each.value.department
  #job_title    = each.value.job_title
}
