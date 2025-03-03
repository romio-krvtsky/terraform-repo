data "aws_availability_zones" "azs" {
  state = "available"
}

output "azs" {
  value = data.aws_availability_zones.azs
}

module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  azs      = data.aws_availability_zones.azs.names
  prefix   = "mentor-TF-prod"
}