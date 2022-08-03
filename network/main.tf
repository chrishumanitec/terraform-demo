terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.24"
    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
  region     = var.region
  access_key = var.credentials.access_key
  secret_key = var.credentials.secret_key
}
