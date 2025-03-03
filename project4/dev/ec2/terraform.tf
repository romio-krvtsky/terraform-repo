terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.79.0"
    }
  }

  required_version = ">= 1.2.0"

}

provider "aws" {
  region  = "eu-north-1"
  profile = "terraform"

  default_tags {
    tags = {
      Environment = "dev"
      Owner       = "Mentor"
      Project     = "Ann-TF"
    }
  }
}
