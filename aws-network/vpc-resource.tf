resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc-cidr-block

  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "my-vpc"
  }
}
