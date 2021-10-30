# IAM, Users, Policies & Roles

- Criar um grupo de usuários ([iam_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group))
- Criar um usuário ([iam_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user))
- Definir usuário com `programmatic access` ([iam_access_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key))
- Inserir o usuário no grupo ([iam_user_group_membership](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership))

<br>

É obrigatório definir a output do atributo **secret** do **aws_iam_access_key** como `sensitive = true`. <br>
A *secret* não será impressa no terminal mas pode ser vista no arquivo **terraform.tfstate**. <br>
``` hcl
output "key-out" {
  value     = aws_iam_access_key.accesskey.secret
  sensitive = true
}

# terminal output: key-out  = (sensitive value)
```
