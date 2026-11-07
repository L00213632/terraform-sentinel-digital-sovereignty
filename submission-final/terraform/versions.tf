
terraform {
  required_version = ">= 1.4.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 6.71.0"
    }
  }

  cloud {
    organization = "ATUL0012345"

    workspaces {
      name = "digital-sovereignty-demo"
    }
  }
}