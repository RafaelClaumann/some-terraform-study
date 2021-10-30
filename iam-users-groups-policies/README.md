# IAM, Users, Policies & Roles

`/users-and-groups/ `
- Criar um grupo de usuários ([iam_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group))
- Criar um usuário ([iam_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user))
- Definir usuário com `programmatic access` ([iam_access_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key))
- Inserir o usuário no grupo ([iam_user_group_membership](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership))

`/policies/ `
- Gerador de políticas ([aws policy generator](https://awspolicygen.s3.amazonaws.com/policygen.html))
- Attach policy ao grupo *(inline)* ([iam_group_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy))
- Attach policy ao grupo *(managed)* ([iam_group_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment))
- Data source de politicas gerenciadas pela AWS ([iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy))
