variable "subscription_id" {
  description = "The Subscription ID for the Azure account"
  type        = string
  validation {
    condition     = length(var.subscription_id) == 36
    error_message = "The subscription_id should be a 36-character UUID."
  }
}

variable "tenant_id" {
  description = "The Tenant ID for the Azure account"
  type        = string
  validation {
    condition     = length(var.tenant_id) == 36
    error_message = "The tenant_id should be a 36-character UUID."
  }
}

variable "client_id" {
  description = "The Client ID (Application ID) for the Service Principal"
  type        = string
  validation {
    condition     = length(var.client_id) == 36
    error_message = "The client_id should be a 36-character UUID."
  }
}

variable "client_secret" {
  description = "The Client Secret for the Service Principal"
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.client_secret) > 0
    error_message = "The client_secret cannot be empty."
  }
}
