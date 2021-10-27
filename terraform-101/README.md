# Terraform 101
[Youtube - terraform-101-caio-delgado](https://www.youtube.com/watch?v=bYvdJKTwx_I&ab_channel=CaioDelgado)

Exemplo de instância EC2 utilizando, inicialmente, o id estático de uma AMI. <br>
A AMI mais recente é recuparada através do bloco **data "aws_ami"**<br>
O [primeiro comimit](https://github.com/RafaelClaumann/some-terraform-study/commit/304deb6ecef091b4d87056163aac17deb75798c2#diff-01000b8b33e9e6e83fdece06614175b7868908bda92cc39a6925f15a284ccab3) da branch **terraform-101** é o exemplo de uso da **AMI estática**, isto é, **copiar o ID** do console AWS e **colar no código terraform**. <br>
O [commit seguinte](https://github.com/RafaelClaumann/some-terraform-study/commit/406136b388378e79750195a8c24dfb9f5822653c#diff-01000b8b33e9e6e83fdece06614175b7868908bda92cc39a6925f15a284ccab3) resolve este "problema".<br>
> AMI = Amazon Machine Image
> Os ids das AMIs são baseados por região

``` bash
Lista de AMIs(us-east-1): https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#Images
Id Canonical: 099720109477
AMI name: ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*
```
