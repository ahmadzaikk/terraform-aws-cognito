variable "user_pool_name" {
  description = "The name of the Cognito User Pool"
  type        = string
}

variable "auto_verified_attributes" {
  description = "The attributes to verify (e.g., email, phone_number)"
  type        = list(string)
  default     = ["email"]
}

variable "mfa_configuration" {
  description = "MFA configuration (ON, OFF, OPTIONAL)"
  type        = string
  default     = "OFF"
}

variable "password_minimum_length" {
  description = "Minimum password length"
  type        = number
  default     = 8
}

variable "require_lowercase" {
  description = "Whether to require lowercase in passwords"
  type        = bool
  default     = true
}

variable "require_numbers" {
  description = "Whether to require numbers in passwords"
  type        = bool
  default     = true
}

variable "require_symbols" {
  description = "Whether to require symbols in passwords"
  type        = bool
  default     = true
}

variable "require_uppercase" {
  description = "Whether to require uppercase in passwords"
  type        = bool
  default     = true
}

variable "temporary_password_validity_days" {
  description = "Number of days the temporary password is valid"
  type        = number
  default     = 7
}

variable "user_pool_client_name" {
  description = "The name of the Cognito User Pool Client"
  type        = string
}

variable "generate_secret" {
  description = "Whether to generate a secret for the User Pool Client"
  type        = bool
  default     = false
}

variable "allowed_oauth_flows_user_pool_client" {
  description = "Whether this client supports user pool client-based OAuth2 flows"
  type        = bool
  default     = true
}

variable "allowed_oauth_flows" {
  description = "The allowed OAuth flows (e.g., 'code', 'implicit', 'client_credentials')"
  type        = list(string)
  default     = ["code"]
}

variable "allowed_oauth_scopes" {
  description = "The allowed OAuth scopes"
  type        = list(string)
  default     = ["email", "openid"]
}

variable "callback_urls" {
  description = "The callback URLs for the User Pool Client"
  type        = list(string)
  default     = []
}

variable "logout_urls" {
  description = "The logout URLs for the User Pool Client"
  type        = list(string)
  default     = []
}

variable "supported_identity_providers" {
  description = "The supported identity providers for the User Pool Client"
  type        = list(string)
  default     = ["COGNITO"]
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
