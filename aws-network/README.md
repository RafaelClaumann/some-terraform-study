# AWS NETWORK e EC2 Instance

## AWS Network
- [main](https://github.com/RafaelClaumann/some-terraform-study/blob/aws-vpc-gateway-routetable-terraform/aws-network/code/main.tf)
- [vpc](https://github.com/RafaelClaumann/some-terraform-study/blob/aws-vpc-gateway-routetable-terraform/aws-network/network-module/vpc-resource.tf)
- [public subnet](https://github.com/RafaelClaumann/some-terraform-study/blob/aws-vpc-gateway-routetable-terraform/aws-network/network-module/subnet-resource.tf)
- [gateway](https://github.com/RafaelClaumann/some-terraform-study/blob/aws-vpc-gateway-routetable-terraform/aws-network/network-module/internet-gateway-resource.tf)
- [route table](https://github.com/RafaelClaumann/some-terraform-study/blob/aws-vpc-gateway-routetable-terraform/aws-network/network-module/public-route-table-resource.tf)
- [security group](https://github.com/RafaelClaumann/some-terraform-study/blob/aws-vpc-gateway-routetable-terraform/aws-network/network-module/security-group-resource.tf)


## Materiais sobre AWS
- [AWS AMER Summit 2020 | Fundamentos de rede da AWS](https://www.youtube.com/watch?v=lOv-Z4vMhfQ)
- [Configuração da rede privada (VPC) na AWS - Curso Prático AWS](https://www.youtube.com/watch?v=WMsADIgy4ms)
- [AWS - Como criar VPC com Subnet Pública e Privada](https://www.youtube.com/watch?v=3okhljXN9aA)
- [AWS VPC - Construindo do Zero](https://www.youtube.com/watch?v=H0RgS5CHTQ0)

## Materiais sobre terraform
- [Lucas de Souza - Terraform além do básico | #FiqueEmCasaConf](https://www.youtube.com/watch?v=P3aY4_vxzWQ&t=3242s&ab_channel=LINUXtips)
- [Caio Delgado - Terraform - Bootstrap EC2 Apache HTTP Server](https://www.youtube.com/watch?v=rvR4nYXAp_0)
- [Terraform | Create a VPC, subnets and more...](https://medium.com/@aliatakan/terraform-create-a-vpc-subnets-and-more-6ef43f0bf4c1)
- [SSH into terraform EC2 instance](https://stackoverflow.com/questions/61748989/cant-ssh-into-ec2-instance-created-with-terraform)
- [Create your own Custom AWS VPC using Terraform](https://www.linkedin.com/pulse/create-your-own-custom-aws-vpc-using-terraform-design-abhinav-paul/)


## Requisitos para Iniciar a Infraestrutura
- AWS CLI instalado e configurado 
- Usuario no IAM com **Programmatic access**
- Credenciais e profile no arquivo **~/.aws/credentials**
> [terraform-study] é o profile, ele pode ser alterado
``` bash
[terraform-study]
aws_access_key_id = <ACCESS_KEY>
aws_secret_access_key = <SECRET_KEY>
```
- Configurar profile e região no [main.tf](https://github.com/RafaelClaumann/some-terraform-study/blob/aws-vpc-gateway-routetable-terraform/aws-network/code/main.tf)
- Definir parametros para criar os serviços do modulo de rede
> exemplo do arquivo main no diretório **/aws-network/code/**
``` hcl
  vpc-name              = "vpc-pessoal"
  public-subnet-name    = "subnet-publica"
  internet-gateway-name = "internet-gateway"
  route-table-name      = "route-table-subnet-publica"
  security-group-name   = "security-group-ssh22-http80"

  vpc-cidr-block           = "10.0.0.0/16"
  route-table-cidr-block   = "0.0.0.0/0"
  public-subnet-cidr-block = "10.0.1.0/24"
```
- *opcional*: criar diretório **~/.aws/ec2-ssh/** e gerar um par de chaves para conexão via SSH
> as chaves SSH são opcionais mas se não existirem será necessário desabilitar o resource **key_pair** do arquivo ec2-instance.tf e remover sua referencia no **aws_instance** <br>

> a chave publica(**key.pub**) é "*enviada*" para aws através do resource **key_pair** 
``` bash
cd ~/.aws/
mkdir /ec2-ssh/
ssh-keygen -q -t rsa -f key -N ''
ls -l
    # -rw------- 1 user user 2622 out 24 01:13 key
    # -rw-r--r-- 1 user user  582 out 24 01:13 key.pub
```
- Provisionar infraestrutura
``` bash
~/aws-network/code terraform init

~/aws-network/code terraform plan

~/aws-network/code terraform apply

~/aws-network/code terraform destroy
```
