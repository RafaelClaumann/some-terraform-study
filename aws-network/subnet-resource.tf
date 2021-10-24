# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  first_zone = data.aws_availability_zones.available.names[0]
}

resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = var.public-subnet-cidr-block

  availability_zone = local.first_zone

  tags = {
    Name = "my-public-subnet"
    AZ   = join("-", ["publicc", "subnet", local.first_zone])
  }
}
