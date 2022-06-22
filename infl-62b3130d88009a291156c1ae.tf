resource "aws_lambda_function" "aws_lambda_function_hifnxm" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SERVER_INTERNAL_KEY_SECRET = "REDACTED-BY-FIREFLY:d488dbb3c64e7310cdc440a96393f883fa6dd46e7c030662952f2a3b6d1c49cc:sha256"
      APP_SERVER_URI                 = "https://prodapi.gofirefly.io/api"
    }
  }
  function_name    = "prod-runtasks"
  image_uri        = "094724549126.dkr.ecr.us-east-1.amazonaws.com/prod-runtasks@sha256:95dd7632b79a0e1f63debcb581de0a5571a2452406cbb62d917730c51f7be9e9"
  package_type     = "Image"
  role             = "arn:aws:iam::094724549126:role/prod-runtasks"
  source_code_hash = "95dd7632b79a0e1f63debcb581de0a5571a2452406cbb62d917730c51f7be9e9"
  timeout          = 30
  tracing_config {
    mode = "Active"
  }
}

