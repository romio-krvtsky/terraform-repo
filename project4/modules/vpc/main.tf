resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "${var.prefix}-VPC"
  }
}

locals {
  azs_public_subnets  = { for k, v in var.azs : v => cidrsubnet(var.vpc_cidr, 8, k + 4) }
  azs_private_subnets = { for k, v in var.azs : v => cidrsubnet(var.vpc_cidr, 8, k + 10) }
}


resource "aws_subnet" "public_subnets" {
  vpc_id            = aws_vpc.vpc.id
  for_each          = local.azs_public_subnets
  availability_zone = each.key
  cidr_block        = each.value

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.prefix}-public-subnet-${each.key}"
  }
}

resource "aws_subnet" "private_subnets" {
  vpc_id            = aws_vpc.vpc.id
  for_each          = local.azs_private_subnets
  availability_zone = each.key
  cidr_block        = each.value



  tags = {
    Name = "${var.prefix}-private-subnet-${each.key}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.prefix}-ig"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.prefix}-rt"
  }
}

resource "aws_route_table_association" "public_rt_asso" {
  for_each       = aws_subnet.public_subnets
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_rt.id
}