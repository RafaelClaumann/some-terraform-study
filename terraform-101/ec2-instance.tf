# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

data "aws_ami" "ubuntu_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu_ami.image_id
  instance_type = var.instance_type

  tags = {
    Name        = var.name
    Environment = var.env
    Provisioner = "Terraform"
    Repository  = var.repository
  }
}
