resource "aws_cognito_user_pool" "this" {
  name                      = var.user_pool_name
  auto_verified_attributes   = var.auto_verified_attributes
  mfa_configuration          = var.mfa_configuration

  password_policy {
    minimum_length                   = var.password_minimum_length
    require_lowercase                = var.require_lowercase
    require_numbers                  = var.require_numbers
    require_symbols                  = var.require_symbols
    require_uppercase                = var.require_uppercase
    temporary_password_validity_days = var.temporary_password_validity_days
  }

  tags = var.tags
}

resource "aws_cognito_user_pool_client" "this" {
  user_pool_id                = aws_cognito_user_pool.this.id
  name                        = var.user_pool_client_name
  generate_secret             = var.generate_secret
  allowed_oauth_flows         = var.allowed_oauth_flows
  allowed_oauth_scopes        = var.allowed_oauth_scopes
  callback_urls               = var.callback_urls
  logout_urls                 = var.logout_urls
  supported_identity_providers = var.supported_identity_providers
}


resource "aws_cognito_user" "this" {
  for_each = { for user in var.users : user.username => user }
  user_pool_id = aws_cognito_user_pool.this.id
  email_verified     = false  
  username     = each.value.username
  attributes = {
    email        = each.value.email
    phone_number = each.value.phone_number
  }
  temporary_password = each.value.temporary_password
  message_action     = "SUPPRESS"  # Optional: Suppress the invitation email
}
