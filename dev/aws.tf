terraform {
  backend "s3" {
    bucket = "devils-bucket"
    key    = "tf-state/jenkins-dynamic-agents/dev/terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.8.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
