# some-terraform-study

Repositório utilizado para armazenar laboratórios de Terraform. <br>
A branch master representa a junção de todos os laboratórios. <br>
Para cada novo laboratório uma nova branch é criada e, ao final do laboratório, é feito um merge com a master. <br>
As pastas dos laboratórios possuem arquivos README para ajudar a compreender o que foi realizado. <br>

- [LAB01: terraform-101](https://github.com/RafaelClaumann/some-terraform-study/tree/terraform-101) `/terraform-101/`
- [LAB02: do-basico-a-modulos](https://github.com/RafaelClaumann/some-terraform-study/tree/do-basico-a-modulos) `/do-basico-a-modulos/`
- [LAB03: aws-vpc-gateway-routetable-terraform](https://github.com/RafaelClaumann/some-terraform-study/tree/aws-vpc-gateway-routetable-terraform) `/aws-network/`

## Guias
- [Install Terraform (*5:22*) & AWS CLI (*14:35*)](https://youtu.be/bYvdJKTwx_I?t=874)
- Exemplo arquivo **~/.aws/credentials**
  ```bash
    [terraform-study]
    aws_access_key_id = <YOUR_ACCESS_KEY>
    aws_secret_access_key = <YOUR_SECRET_KEY>

  ```


## 💻 Comandos Basicos

`terraform init`  # download do(s) provider(s) <br>
`terraform fmt`  # formatar o código <br>
`terraform plan`  # planejar execução <br>
`terraform apply`  # implantar infraestrutura <br>
`terraform destroy`  # destruir infraestrutura <br>


## :bricks: Blocos Basicos

### Provider
Bloco de conexão com o provider(provedor), por exemplo AWS.
``` hcl
provider "aws" {
  region  = "us-east-1"
  profile = "awsrafael" # utilizando profile do arquivo ~/.aws/credentials
}
```

### Resource
Bloco utilizado para criar recursos. <br>
O nome **"server"** é utilizado para referenciar o recurso em outros arquivos terraform.
``` hcl
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu.image_id  # referencia o bloco data
  instance_type = "t2.micro"
}
```

### Variable
Bloco para declarar variveis acessíveis/acessadas a partir de outros arquivos terraform. <br>
O nome **"region"** foi escolhido arbitráriamente, este repositório tem as [variables](https://github.com/RafaelClaumann/some-terraform-work/blob/main/terraform-101/variables.tf)
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
### Output
Bloco util que para exibir informações na tela, seu uso é bastante conveniente para extrair informaçõe dos **resources**.<br>
É possível encontrar os **outputs** para cada **resource** na [documentação](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) do provider. <br>
Os nomes **"public_ip"** & **"instance_region"** foram escolhidos abitráriamente, este repositório contém estas [outputs](https://github.com/RafaelClaumann/some-terraform-work/blob/main/terraform-101/output.tf).
``` hcl
output "public_ip" {
  value = aws_instance.ubuntu.public_ip
}

output "instance_region" {
  value = var.region
}
```
### Data
Bloco utilizado para buscar informações sobre os recursos do provider em tempo de execução. <br>
O exemplo abaixo mostra como o bloco **data** pode ser configurado para buscar a versão mais recente de uma **ami** na aws. <br>
o bloco **resouce** dos exemplos anteriores fez referencia ao retorno do bloco **data** para definir a imagem da instancia EC2.<br>
Um exemplo de uso do bloco **data** pode ser encontrado no arquivo [ec2-instance.tf](https://github.com/RafaelClaumann/some-terraform-work/blob/main/terraform-101/ec2-instance.tf) na branch **terraform-101**.
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
