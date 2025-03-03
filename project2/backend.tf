terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.79.0"
    }
  }

  required_version = ">= 1.2.0"

  # backend "s3" {
  #   bucket         = "mentor.bucket.terraform.state"
  #   key            = "terraform.tfstate"
  #   region         = "eu-north-1"
  #   dynamodb_table = "mentor-terraform-lock-table"
  #   profile        = "terraform"
  #   encrypt        = true
  # }
}
