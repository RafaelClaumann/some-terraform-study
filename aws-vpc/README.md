## `/aws-vpc/`

- [cidrsubnet](https://www.terraform.io/docs/language/functions/cidrsubnet.html)
```hcl
        ## VPC ##
        ip: 192.168.0.0/16
        mask: 255.255.0.0 (11111111.11111111.00000000.00000000)

        ## FUNCTION ##
        cidrsubnet(aws_vpc.main.cidr_block, 8, 10)

        ## SUBNET ##
        ip: 192.168.10.0/24
        mask: 255.255.255.0 (11111111.11111111.11111111.00000000)
        network: 192.168.10.0
        broadcast: 192.168.10.255
        hosts: (2^8) - 2 = 254
  
```

```hcl
        ## VPC ##
        ip: 192.168.0.0/16
        mask: 255.255.0.0 (11111111.11111111.00000000.00000000)

        ## FUNCTION ##
        cidrsubnet(aws_vpc.main.cidr_block, 6, 10)

        ## SUBNET ##
        ip: 192.168.40.0/22
        mask: 255.255.252.0 (11111111.11111111.11111100.00000000)
        network: 192.168.40.0
        broadcast: 192.168.40.255
        hosts: (2^10) - 2 = 1022
```

``` hcl
    cidrsubnet("192.168.0.0/16", 6, 10)
    
    # 1) Rede original
       255         255         0         0  
       192         168         0         0       /16
    11000000   10101000 |  00000000   00000000
    parent network      |         host
     
    # 2) Adicionando 6 bits a máscara
       255        255        252          0
       192        168        10           0      /22
    11000000   10101000 |  001010 | 00  00000000
    parent network      |  netnum |    hosts
    
    # 3) Resultado final em decimal/binario
       255        255        252          0
       192        168        40           0      /22
    11000000   10101000 |  00101000 | 00000000
    parent network      |  netnum   |    hosts
    
    Porque o ip ficou 192.168.40.0 se eu passei 10 como parâmetro?
      001010 = 10
      00101000 = 2^2 * 10 = 40
      Acontece no passo 3 quando reagrupamos os bits para fazer
      a representação decimal.
        
    sub-net 1: 
        192.168.40.0 -> 192.168.40.255 => (256 - 2) = 254 hosts
        192.168.41.0 -> 192.168.41.255 => (256 - 2) = 254 hosts
        192.168.42.0 -> 192.168.42.255 => (256 - 2) = 254 hosts
        192.168.43.0 -> 192.168.43.255 => (256 - 2) = 254 hosts
    
    sub-net 2:
        192.168.44.0 -> 192.168.44.255 => (256 - 2) = 254 hosts
        (...)

    sub-net 3:
        192.168.47.0 -> 192.168.48.255 => (256 - 2) = 254 hosts
        (...)
```