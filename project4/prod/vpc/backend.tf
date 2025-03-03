terraform {
  backend "s3" {
    bucket         = "mentor.bucket.terraform.state"
    key            = "prod/vpc.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "mentor-terraform-lock-table"
    profile        = "terraform"
    encrypt        = true
  }
}
