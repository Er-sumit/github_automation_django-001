terraform {
  cloud {
    organization = "own-space"

    workspaces {
      name = "Django-gh-actions-test"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "network" {
  source = "terraform-aws-modules/vpc/aws"

  name = "dev-vpc"
  cidr = var.vpc_cidr

  azs            = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]


  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev1"
  }
}

