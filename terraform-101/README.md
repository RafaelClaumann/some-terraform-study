# Terraform 101
[Youtube - terraform-101-caio-delgado](https://www.youtube.com/watch?v=bYvdJKTwx_I&ab_channel=CaioDelgado)


> AMI = Amazon Machine Image <br>
>  Os ids das AMIs são baseados por região

<br>

Este laboratório contempla o provisionamento de uma instância EC2 utilizando, inicialmente, o id estático de uma AMI. <br>
O [primeiro comimit](https://github.com/RafaelClaumann/some-terraform-study/commit/304deb6ecef091b4d87056163aac17deb75798c2#diff-01000b8b33e9e6e83fdece06614175b7868908bda92cc39a6925f15a284ccab3) da branch **terraform-101** é o exemplo de uso da **AMI estática**, isto é, **copiar o ID** do console AWS e **colar no código terraform**. <br>

Com a evolução do exemplo passamos a utilizar o id dinâmico da AMI. <br>
O [commit seguinte](https://github.com/RafaelClaumann/some-terraform-study/commit/406136b388378e79750195a8c24dfb9f5822653c#diff-01000b8b33e9e6e83fdece06614175b7868908bda92cc39a6925f15a284ccab3) resolve este "problema".<br>
Utilizamos o bloco abaixo para buscar a AMI mais recente filtrando pelo **nome** & **owner**:
``` hcl
data "aws_ami" "ubuntu_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}
```
<br>

### Onde encontrar as informações sobre as AMIs?
- Lista de AMIs (*us-east-1*): **https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#Images**
- Id Canonical (*owner*): **099720109477**
- Nome AMI: **ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-**
