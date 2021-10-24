# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
data "aws_ami" "ubuntu_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

# é preciso gerar um par de chaves com nome key e key.pub na pasta ~/.aws/ec2-ssh 
# basta executar o comando(ssh-keygen -q -t rsa -f key -N '') na pasta /ec2-ssh
resource "aws_key_pair" "ssh-key" {
  key_name   = "key"
  public_key = file("~/.aws/ec2-ssh/key.pub")
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu_ami.image_id
  instance_type = "t2.micro"

  key_name  = aws_key_pair.ssh-key.key_name
  user_data = file("scripts/bootstrap-ec2.sh")

  availability_zone           = module.network.public-subnet-az
  subnet_id                   = module.network.public-subnet-id
  vpc_security_group_ids      = [module.network.security-group-id]
  associate_public_ip_address = true

  tags = {
    Name        = "ubuntu-instance"
    Environment = "dev"
    Provisioner = "Terraform"
    Repository  = "https://github.com/RafaelClaumann/some-terraform-study/tree/aws-vpc-gateway-routetable-terraform"
  }
}
