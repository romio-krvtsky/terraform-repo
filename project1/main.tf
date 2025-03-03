terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "eu-north-1"
  profile = "terraform"
}

resource "aws_instance" "app_server" {
  ami           = "ami-09a9858973b288bdd"
  instance_type = "t3.micro"

  user_data = file("userdata.sh")

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
