resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  subnets            = ["subnet-00c8d18b9a13cb4a2", "subnet-0caab5db9b95fb3db"]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

# LISTENER
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lambda-example.arn
  }
}

# TARGET GROUP
resource "aws_lambda_permission" "with_lb" {
  statement_id  = "AllowExecutionFromlb"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.test_lambda.function_name
  principal     = "elasticloadbalancing.amazonaws.com"
  source_arn    = aws_lb_target_group.lambda-example.arn
}

resource "aws_lb_target_group" "lambda-example" {
  name        = "tf-example-lb-tg"
  target_type = "lambda"
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.lambda-example.arn
  target_id        = aws_lambda_function.test_lambda.arn
  depends_on       = [aws_lambda_permission.with_lb]
}


# SECURITY GROUP
resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic"
  vpc_id      = "vpc-0da21e648b66a0489"

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["191.191.49.61/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_http"
  }
}
