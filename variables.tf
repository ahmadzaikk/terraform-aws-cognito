# Variable for user pool name
variable "user_pool_name" {
  description = "The name of the Cognito User Pool"
  type        = string
}

# Variable for auto verified attributes (such as email, phone number)
variable "auto_verified_attributes" {
  description = "List of attributes to auto-verify (email, phone_number)"
  type        = list(string)
}

# Variable for MFA configuration
variable "mfa_configuration" {
  description = "MFA configuration for the Cognito User Pool"
  type        = string
  default     = "OFF"
}

# Variable for password policy settings
variable "password_minimum_length" {
  description = "Minimum password length for user pool"
  type        = number
  default     = 8
}

variable "require_lowercase" {
  description = "Require lowercase letters in the password"
  type        = bool
  default     = true
}

variable "require_numbers" {
  description = "Require numbers in the password"
  type        = bool
  default     = true
}

variable "require_symbols" {
  description = "Require symbols in the password"
  type        = bool
  default     = true
}

variable "require_uppercase" {
  description = "Require uppercase letters in the password"
  type        = bool
  default     = true
}

variable "temporary_password_validity_days" {
  description = "Validity period (in days) for temporary passwords"
  type        = number
  default     = 7
}

# Variable for user pool client settings
variable "user_pool_client_name" {
  description = "The name of the Cognito User Pool Client"
  type        = string
}

variable "generate_secret" {
  description = "Whether to generate a secret for the user pool client"
  type        = bool
  default     = false
}

variable "allowed_oauth_flows_user_pool_client" {
  description = "The allowed OAuth flows for the user pool client"
  type        = list(string)
  default     = ["code"]
}

variable "allowed_oauth_flows" {
  description = "The allowed OAuth flows"
  type        = list(string)
  default     = ["implicit", "code"]
}

variable "allowed_oauth_scopes" {
  description = "The allowed OAuth scopes"
  type        = list(string)
  default     = ["openid", "profile"]
}

variable "callback_urls" {
  description = "List of callback URLs for the user pool client"
  type        = list(string)
  default     = []
}

variable "logout_urls" {
  description = "List of logout URLs for the user pool client"
  type        = list(string)
  default     = []
}

variable "supported_identity_providers" {
  description = "List of identity providers supported by the user pool client"
  type        = list(string)
  default     = ["COGNITO"]
}

# Variable to hold user data for dynamic user creation
variable "users" {
  description = "List of users to create in Cognito"
  type = list(object({
    username           = string
    email              = string
    temporary_password = string
  }))
  default = []
}


variable "users" {
  description = "List of users to create in Cognito"
  type = list(object({
    username           = string
    email              = string
    temporary_password = string
  }))
  default = []
}

