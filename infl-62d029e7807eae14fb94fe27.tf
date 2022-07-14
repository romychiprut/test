resource "aws_ssm_parameter" "stag-flywheel-fetcher-producer-chunks-ea1" {
  arn   = "arn:aws:ssm:us-west-2:094724549126:parameter/stag-flywheel-fetcher-producer-chunks"
  name  = "stag-flywheel-fetcher-producer-chunks"
  type  = "String"
  value = "REDACTED-BY-FIREFLY"
}

