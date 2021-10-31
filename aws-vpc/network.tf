resource "aws_vpc" "main" {
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "my_vpc"
  }
}

resource "aws_subnet" "private" {
  count = length(var.availability_zones)

  vpc_id = aws_vpc.main.id

  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 6, count.index + 10)
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "private_subnet_${count.index}"
  }
}

resource "aws_subnet" "public" {
  count = length(var.availability_zones)

  vpc_id = aws_vpc.main.id

  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 6, count.index + 20)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_${count.index}"
  }
}
