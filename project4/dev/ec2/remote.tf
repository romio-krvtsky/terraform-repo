data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    profile        = "terraform"
    bucket         = "mentor.bucket.terraform.state"
    key            = "dev/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "mentor-terraform-lock-table"
  }
}
