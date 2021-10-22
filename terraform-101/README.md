# Terraform 101
[terraform-101-caio-delgado](https://www.youtube.com/watch?v=bYvdJKTwx_I&ab_channel=CaioDelgado)

`terraform init`  # download do(s) provider(s) <br>
`terraform fmt`  # formatar o código <br>
`terraform plan`  # planejar execução <br>
`terraform apply`  # implantar infraestrutura <br>
`terraform destroy`  # destruir infraestrutura <br>

**tip:** no primeiro commit nós usamos uma ami estática, o id desta ami pode ser encontrado no processo de criação das instâncias ec2

**ami list:** [amis-us-east-1](https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#Images:) <br>
**owner (Canonical):** 099720109477 <br>
**ami name:** ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-* <br>
