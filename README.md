# some-terraform-study

Repositório utilizado para armazenar laboratórios de Terraform.
- [aws-network](https://github.com/RafaelClaumann/some-terraform-study/tree/main/aws-network)
- [aws-sqs-sns](https://github.com/RafaelClaumann/some-terraform-study/tree/main/aws-sqs-sns)
- [aws-vpc](https://github.com/RafaelClaumann/some-terraform-study/tree/main/aws-vpc)
- [do-basico-a-modulos](https://github.com/RafaelClaumann/some-terraform-study/tree/main/do-basico-a-modulos)
- [terraform-101](https://github.com/RafaelClaumann/some-terraform-study/tree/main/terraform-101)

## Guias
- [Install Terraform (*5:22*) & AWS CLI (*14:35*)](https://youtu.be/bYvdJKTwx_I?t=874)
- Exemplo do arquivo **~/.aws/credentials**
```bash
  [terraform-study]
  aws_access_key_id = <YOUR_ACCESS_KEY>
  aws_secret_access_key = <YOUR_SECRET_KEY>
```


## 💻 Comandos Basicos
``` bash
terraform init  # download do(s) provider(s)
terraform fmt  # formatar o código
terraform plan  # planejar execução
terraform apply  # implantar infraestrutura
terraform destroy  # destruir infraestrutura
```


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
Bloco utilizado para criar recursos disponibilizados pelo provider. <br>
O nome **"server"** pode ser utilizado para referenciar o recurso em outros arquivos terraform.
``` hcl
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu.image_id  # referencia o bloco data
  instance_type = "t2.micro"
}
```

### Variable
Bloco usado para declarar variáveis. Essas variáveis podem ser acessadas em outros arquivos terraform e devem ser preenchidas na execução dos comandos plan e/ou apply.<br>
``` hcl
variable "region" {
  type        = string # numer, boolean, list, map
  default     = "us-east-1"
  description = "define instance region"
}

# acessing_list: var.list_example[0]
variable "list_example" {
  type        = list 
  description = "list example varible"
  default     = ["first_item", "second_item", "third_item"]
}

# acessing_map: var.amis["us-east-1"]
variable "amis" {
  type    = map
  default = {
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-4b32be2b"
  }
}
```
### Output
Bloco útil para exibir informações na tela após a criação dos recursos, seu uso é bastante conveniente para extrair dados dos **resources**.

É possível encontrar os **outputs** padrões para cada **resource** na [documentação](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) do provider.

Os nomes **"public_ip"** & **"instance_region"** foram escolhidos abitráriamente.
``` hcl
# value = resource.resource_name.default_output
output "public_ip" {
  value = aws_instance.ubuntu.public_ip
}

output "instance_region" {
  value = var.region
}
```
### Data
Bloco utilizado para buscar informações dos recursos existentes no provider em tempo de execução.

O exemplo abaixo mostra um bloco **data** configurado para buscar a versão mais recente de uma **ami** na aws.

O bloco **resouce** dos exemplos anteriores fez referencia ao retorno do bloco **data** mostrado abaixo para definir a imagem usada na instancia EC2.
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
