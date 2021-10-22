# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
resource "aws_instance" "ubuntu" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name        = var.name
    Environment = var.env
    Provisioner = "Terraform"
    Repository  = var.repository
  }
}
