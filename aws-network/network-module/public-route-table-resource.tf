# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association

resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = var.route-table-cidr-block
    gateway_id = aws_internet_gateway.my-igw.id
  }

  tags = {
    Name   = var.route-table-name
    igw-id = aws_internet_gateway.my-igw.id
    vpc-id = aws_vpc.my-vpc.id
  }
}

resource "aws_route_table_association" "associate-route-table-public-subnet" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.route-table.id
}
