# some-terraform-study


**provider** é o bloco de conexão com o provider(provedor), por exemplo AWS.
``` hcl
provider "aws" {
  region  = "us-east-1"
  profile = "awsrafael" # utilizando profile do arquivo ~/.aws/credentials
}
```

**resource** é um bloco utilizado para criar recursos na AWS. <br>
o nome **server** não "vai" para a AWS, este nome é utilizado para referenciar o resource em outros arquivos terraform.
``` hcl
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu.image_id  # referencia o bloco data
  instance_type = "t2.micro"
}
```

**variable**, como o próprio nome diz, é um bloco para declarar variveis acessíveis/acessadas a partir de outros arquivos terraform. <br>
O nome **"region"** foi escolhido arbitráriamente, este reppositório tem as [variables](https://github.com/RafaelClaumann/some-terraform-work/blob/main/terraform-101/variables.tf)
que são utilizadas no [ec2-instance.tf](https://github.com/RafaelClaumann/some-terraform-work/blob/main/terraform-101/ec2-instance.tf) e [main.tf](https://github.com/RafaelClaumann/some-terraform-work/blob/main/terraform-101/main.tf)
``` hcl
variable "region" {
  type        = string # numer, boolean, list, map
  default     = "us-east-1"
  description = "define instance region"
}

# acessing: var.list_example[0]
variable "list_example" {
  type        = list 
  description = "list example varible"
  default     = ["first_item", "second_item", "third_item"]
}

# acessing: var.amis["us-east-1"]
variable "amis" {
  type    = map
  default = {
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-4b32be2b"
  }
}
```

**outputs** é um bloco util que imprime informações na tela, seu uso é bastante conveniente para exibir informaçõe dos **resources**.<br>
Os nomes "public_ip" & "instance_region" foram escolhidos abitráriamente, este repositório contém estas [outputs](https://github.com/RafaelClaumann/some-terraform-work/blob/main/terraform-101/output.tf).
``` hcl
output "public_ip" {
  value = aws_instance.ubuntu.public_ip
}

output "instance_region" {
  value = var.region
}
```
**data** busca recursos do provider em tempo de execução. <br>
o exemplo abaixo mostra como o bloco **data** pode ser configurado para buscar a versão mais recente de uma **ami** na aws. <br>
o bloco **resouce** do exemplo acima referenciou o retorno do bloco **data** para definir a imagem da instancia EC2 que será executada.<br>
neste repositório, um exemplo de uso do bloco **data** pode ser encontrado no arquivo [ec2-instance.tf](https://github.com/RafaelClaumann/some-terraform-work/blob/main/terraform-101/ec2-instance.tf).
``` hcl
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]  # nome da ami
  }

  owners = ["099720109477"]  # id da canonical
}
```
