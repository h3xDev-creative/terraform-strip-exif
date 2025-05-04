terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Vault provider (AppRole authentication)
provider "vault" {
  address = var.vault_address

  auth_login {
    path = "auth/approle/login"
    parameters = {
      role_id   = var.vault_role_id   # non‑sensitive ID
      secret_id = var.vault_secret_id # sensitive, injected via CI or Vault Agent
    }
  }

  skip_child_token = true  # avoid permission issues with child tokens
}

# Retrieve AWS credentials dynamically from Vault's AWS secrets engine
data "vault_aws_access_credentials" "terraform" {
  backend = var.vault_aws_backend   # e.g. "aws"
  role    = var.vault_aws_role      # Vault role that mints AWS IAM creds
}

# AWS provider uses the short‑lived credentials returned by Vault
provider "aws" {
  region     = var.aws_region
  access_key = data.vault_aws_access_credentials.terraform.access_key
  secret_key = data.vault_aws_access_credentials.terraform.secret_key
}
