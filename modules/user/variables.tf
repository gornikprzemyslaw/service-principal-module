variable "first_name" {
  type        = string
  description = "(Optional) Name of branch to use with ref entity. Required if entity_type is ref and branch is the target."
}

variable "last_name" {
  type        = string
  description = "(Optional) Name of branch to use with ref entity. Required if entity_type is ref and branch is the target."
}

variable "display_name" {
  type        = string
  description = "(Optional) Name of branch to use with ref entity. Required if entity_type is ref and branch is the target."

}

variable "mail_nickname" {
  type        = string
  description = "(Optional) Name of branch to use with ref entity. Required if entity_type is ref and branch is the target."

}

variable "password" {
  type        = string
  description = "(Optional) Name of branch to use with ref entity. Required if entity_type is ref and branch is the target."

}

variable "tags" {
  type        = map(string)
  description = "Common tags to be applied to resources"
}
