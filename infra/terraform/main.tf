# S3 Bucket
resource "aws_s3_bucket" "main_storage" {
  bucket = "${local.resource_prefix}-main-storage"
}

# Role for scraping lambdas
data "aws_iam_policy_document" "lambda_trust_policy" {
  statement {
    sid    = ""
    effect = "Allow"

    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_role_for_lambda" {
  name               = "${local.resource_prefix}-iam-role-for-lambda"
  assume_role_policy = data.aws_iam_policy_document.lambda_trust_policy.json
}


# Python lambda
data "archive_file" "python_scraping_lambda_zip" {
  type        = "zip"
  source_dir = "${local.path_to_application}/python/scraping_lambda"
  output_path = "hello_lambda.zip"
}

resource "aws_lambda_function" "python_scraping_lambda" {
  function_name = "${local.resource_prefix}-python-scraping-lambda"

  filename         = data.archive_file.python_scraping_lambda_zip.output_path
  source_code_hash = data.archive_file.python_scraping_lambda_zip.output_base64sha256

  role    = aws_iam_role.iam_role_for_lambda.arn
  handler = "main.main"
  runtime = "python3.10"

  environment {
    variables = {
      greeting = "Hello"
    }
  }
}

resource "aws_lambda_function_url" "python_scraping_lambda_url" {
  function_name      = aws_lambda_function.python_scraping_lambda.function_name
  authorization_type = "AWS_IAM"
}