terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
  backend "s3" {
    bucket = "siri-remote-state"
    key    = "expense-dev-acm"
    region = "us-east-1"
    dynamodb_table = "siri-locking"
  }
}

#provide authentication here
provider "aws" {
  region = "us-east-1"
}