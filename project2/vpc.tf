data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  azs = data.aws_availability_zones.available.names # Ensure we're referencing .names, which is a list of strings
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs = local.azs

  # Private subnets using cidrsubnet()
  private_subnets = [for k, v in local.azs : cidrsubnet("10.0.0.0/16", 8, k + 10)]

  # Public subnets using cidrsubnet()
  public_subnets = [for k, v in local.azs : cidrsubnet("10.0.0.0/16", 8, k + 4)]

  #   enable_nat_gateway = true
  #   enable_vpn_gateway = true

}
