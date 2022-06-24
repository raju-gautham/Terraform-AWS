terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
    region = var.region
    access_key = var.accessKey
    secret_key = var.secretKey
    profile = "default"
  }
