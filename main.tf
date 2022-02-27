terraform {
  required_version = "~> 1.1.6"
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "awslyall"
    workspaces { prefix = "vpc-" }
  }
}

provider "aws" {
  region = "eu-west-1"
}

module "network" {
  source = "terraform-aws-modules/vpc/aws"

  name = "dev-vpc"
  cidr = "10.0.0.0/16"

  azs            = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev1"
  }
}

