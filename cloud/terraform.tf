provider "aws" {
  access_key                  = "test" # Use your actual AWS access key
  secret_key                  = "test" # Use your actual AWS secret key
  region                      = "us-east-1"
}



terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0"
    }
  }
}


