terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

variable "region" {
    type = string
}

variable "bucket" {
    type = string
}

variable "credentials" {
    type = object({
        access_key = string
        secret_key = string
    })
    sensitive = true
}

provider "aws" {
  region     = var.region
  access_key = var.credentials.access_key
  secret_key = var.credentials.secret_key
}

module "aws_s3" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = var.bucket
  acl    = "private"
}

output "region" {
  value = module.aws_s3.s3_bucket_region
}

output "bucket" {
  value = module.aws_s3.s3_bucket_bucket_domain_name
}

output "aws_access_key_id" {
  value     = var.credentials.access_key
  sensitive = true
}

output "aws_secret_access_key" {
  value     = var.credentials.secret_key
  sensitive = true
}

