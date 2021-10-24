provider "aws" {
  region  = var.aws_region
  profile = "terraform-study"
}

/*
* This module will create a VPC + PUBLIC SUBNET + GATEWAY + ROUTE TABLE + SECURITY GROUP
*/
module "network" {
  source = "../network-module/"

  aws_region                  = "us-east-1"
  programmatic-access-profile = "terraform-study"

  vpc-name              = "vpc-pessoal"
  public-subnet-name    = "subnet-publica"
  internet-gateway-name = "internet-gateway"
  route-table-name      = "route-table-subnet-publica"
  security-group-name   = "security-group-ssh22-http80"

  vpc-cidr-block           = "10.0.0.0/16"
  route-table-cidr-block   = "0.0.0.0/0"
  public-subnet-cidr-block = "10.0.1.0/24"
}
