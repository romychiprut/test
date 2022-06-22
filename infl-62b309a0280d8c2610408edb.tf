resource "aws_ssm_parameter" "aws_ssm_parameter_jwmimh" {
  arn   = "arn:aws:ssm:us-west-2:094724549126:parameter/stag-flywheel-fetcher-producer-chunks"
  name  = "stag-flywheel-fetcher-producer-chunks"
  type  = "String"
  value = "REDACTED-BY-FIREFLY:caddb07b916ca7a4d8339a2d4ee7c8c1ca6a5c7d97522aa02ba0bee168c5817f:sha256"
}




resource "aws_ssm_parameter" "aws_ssm_parameter_iauyze" {
  arn   = "arn:aws:ssm:us-east-1:094724549126:parameter/prod-flywheel-fetcher-producer-chunks"
  name  = "prod-flywheel-fetcher-producer-chunks"
  type  = "String"
  value = "REDACTED-BY-FIREFLY:caddb07b916ca7a4d8339a2d4ee7c8c1ca6a5c7d97522aa02ba0bee168c5817f:sha256"
}

