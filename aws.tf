terraform {
  backend "s3" {
    bucket = "devils-bucket"
    key    = "tf-state/jenkins-dynamic-agents/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
