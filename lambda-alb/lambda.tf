variable "lambda_function_name" {
  default = "hello-terraform"
}

resource "aws_cloudwatch_log_group" "example" {
  name = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = 1

  tags = {
    Environment = "production"
    Application = "serviceA"
  }
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda_function.py"
  output_path = "lambda_function.zip"
}

resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "lambda_function.zip"
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "lambda_function.lambda_handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.7"

  depends_on = [
    aws_iam_role_policy_attachment.lambda_role_policy_attach,
    aws_cloudwatch_log_group.example,
  ]  

  environment {
    variables = {
      foo = "bar"
    }
  }
}
