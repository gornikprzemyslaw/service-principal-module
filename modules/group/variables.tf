# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "display_name" {
  description = "The display name for the group."
  type        = string
}

variable "description" {
  description = "The description for the group."
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "mail_enabled" {
  description = "Whether the group is a mail enabled, with a shared group mailbox. At least one of mail_enabled or security_enabled must be specified. Only Microsoft 365 groups can be mail enabled (see the types property)."
  type        = bool
  default     = false
}

variable "mail_nickname" {
  description = "The mail alias for the group, unique in the organisation. Required for mail-enabled groups. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

//variable "owners" {
//  description = "A set of object IDs of principals that will be granted ownership of the group. Supported object types are users or service principals. By default, the principal being used to execute Terraform is assigned as the sole owner. Groups cannot be created with no owners or have all their owners removed."
//  type        = set(string)
//  default     = []
//}

variable "security_enabled" {
  description = "Whether the group is a security group for controlling access to in-app resources or not. At least one of security_enabled or mail_enabled must be specified. A Microsoft 365 group can be security enabled and mail enabled (see the types property)."
  type        = bool
}

variable "types" {
  description = "A set of group types to configure for the group. Supported values are DynamicMembership, which denotes a group with dynamic membership, and Unified, which specifies a Microsoft 365 group. Required when mail_enabled is true. Changing this forces a new resource to be created."
  type        = set(string)
  default     = ["Unified"]
}

variable "tags" {
  type        = map(string)
  description = "Common tags to be applied to resources"
}


variable "users" {
  description = "A set of members who should be present in this group. Supported object types are Users, Groups or Service Principals. Cannot be used with the dynamic_membership block."
  type        = set(string)
}


variable "groups" {
  description = "A set of members who should be present in this group. Supported object types are Users, Groups or Service Principals. Cannot be used with the dynamic_membership block."
  type        = set(string)
}

variable "spns" {
  description = "A set of members who should be present in this group. Supported object types are Users, Groups or Service Principals. Cannot be used with the dynamic_membership block."
  type        = set(string)
}
