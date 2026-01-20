# infra/terraform/provider.tf
# Terraform configuration for AutoOps project
# This file sets up the AWS provider to interact with a localstack instance for testing.
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "fake"
  secret_key                  = "fake"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  endpoints {
    ec2 = "http://localhost:4566"
  }
}
