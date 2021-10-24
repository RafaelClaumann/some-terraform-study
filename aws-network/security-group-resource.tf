# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group
# O bloco DATA abaixo serve para fins de exemplo
# buscamos uma lista de security groups da aws e filtramos por description
data "aws_security_groups" "default" {
  filter {
    name   = "description"
    values = ["default VPC security group"]
  }
}

resource "aws_security_group" "http-ssh-security-group" {
  name        = "http-ssh-security-group"
  description = "Allow incoming HTTP(80) & SSH(22) connections."
  vpc_id      = aws_vpc.my-vpc.id

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "http-ssh-security-group"
  }
}