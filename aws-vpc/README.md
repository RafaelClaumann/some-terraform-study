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

``` hcl
OUTRO EXEMPLO:
    cidrsubnet("10.1.2.0/24", 4, 15)

    ------------------------------------------------
       10        1       2           0    /24 
    00001010 00000001 00000010 | 00000000 
           network             |   host
    ------------------------------------------------
       10        1       2         ?       0  /28
    00001010 00000001 00000010 |  XXXX  | 0000
          parent network       | netnum | host
    ------------------------------------------------
       10        1       2         15      0  /28
    00001010 00000001 00000010 |  1111  | 0000
          parent network       | netnum | host
    ------------------------------------------------
       10         1       2        240   /28
    00001010 00000001 00000010 | 11110000
         parent network        | netnum+host
    ------------------------------------------------

# To convert this back into normal decimal notation we need to recombine the two portions of the final octet.
# Converting 11110000 from binary to decimal gives 240, which can then be combined with our new
# prefix length of 28 to produce the result 10.1.2.240/28

# The new subnet has four bits available for host numbering, which means that there are 14 host addresses
# available for assignment once we subtract the network's own address and the broadcast address. 
```
