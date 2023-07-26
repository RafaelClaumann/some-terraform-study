data "aws_iam_policy_document" "trust_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# create lambda_execution_role with trust_policy
resource "aws_iam_role" "lambda_execution_role" {
  name               = "lambda_execution_role"
  assume_role_policy = data.aws_iam_policy_document.trust_policy.json
}

data "aws_iam_policy" "lambda_basic_policy" {
  name = "AWSLambdaBasicExecutionRole"
}

# attach lambda basic_policy to lambda_execution_role
resource "aws_iam_role_policy_attachment" "lambda_role_policy_attach" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = data.aws_iam_policy.lambda_basic_policy.arn
}
