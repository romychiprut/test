resource "aws_lambda_function" "stag-producer-cft-mapper-ec5" {
  architectures = ["x86_64"]
  environment {
    variables = {
      ENVIRONMENT     = "${aws_key_pair.stag-848.id}"
      FETCHER_SQS     = "${aws_sqs_queue.stag-producer-cft-mapper-db0.id}"
      FLYWHEEL_PREFIX = "flywheel"
      MONGODB_URI     = "mongodb+srv://superadmin:REDACTED-BY-FIREFLY:04190df60aacce4817e28e845045c632e22c540feeebe354ea21466cecbcc557:sha256@infralight.xzpxo.mongodb.net/infralight?retryWrites=true&w=majority&ssl=true&ssl_cert_reqs=CERT_NONE"
      RUN_LOCAL       = "0"
    }
  }
  function_name    = "stag-producer-cft-mapper"
  handler          = "cft_mapper/producer.lambda_handler"
  memory_size      = 256
  role             = "arn:aws:iam::094724549126:role/stag-producer-cft-mapper"
  runtime          = "python3.8"
  source_code_hash = "R04YD5JmjLwuttt4hiM7wuiSdh7muOPpxnqjNzeUFOc="
  tags = {
    Name = "stag-producer-cft-mapper"
    env  = "${aws_key_pair.stag-848.id}"
  }
  timeout = 30
  tracing_config {
    mode = "Active"
  }
  vpc_config {
    security_group_ids = ["${aws_security_group.stag-producer-cft-mapper-271.id}"]
    subnet_ids         = ["${aws_subnet.stag-lambda1-289.id}", "${aws_subnet.stag-lambda2-f1a.id}"]
  }
}




resource "aws_key_pair" "stag-848" {
  key_name   = "stag"
  public_key = "PUT-VALUE-HERE"
}




resource "aws_sqs_queue" "stag-producer-cft-mapper-db0" {
  message_retention_seconds = 3600
  name                      = "stag-producer-cft-mapper"
  redrive_policy            = "{\"deadLetterTargetArn\":\"arn:aws:sqs:us-west-2:094724549126:stag-producer-cft-mapper-dl-queue\",\"maxReceiveCount\":25}"
  tags = {
    env = "${aws_key_pair.stag-848.id}"
  }
  visibility_timeout_seconds = 43200
}




resource "aws_subnet" "stag-lambda2-f1a" {
  cidr_block                          = "10.1.224.0/19"
  private_dns_hostname_type_on_launch = "ip-name"
  tags = {
    Name = "stag-lambda2"
  }
  vpc_id = "${aws_vpc.stag-vpc-d2d.id}"
}




resource "aws_subnet" "stag-lambda1-289" {
  cidr_block                          = "10.1.192.0/19"
  private_dns_hostname_type_on_launch = "ip-name"
  tags = {
    Name = "stag-lambda1"
  }
  vpc_id = "${aws_vpc.stag-vpc-d2d.id}"
}




resource "aws_security_group" "stag-producer-cft-mapper-271" {
  description = "stag producer-cft-mapper securitygroup"
  egress {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Git Clone"
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    to_port          = 22
  }
  egress {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "HTTP"
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    to_port          = 80
  }
  egress {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "HTTPS"
    from_port        = 443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    to_port          = 443
  }
  egress {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Oasis"
    from_port        = 18529
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    to_port          = 18529
  }
  egress {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Vault"
    from_port        = 8200
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    to_port          = 8200
  }
  egress {
    cidr_blocks      = ["10.1.0.0/16", "192.168.232.0/21", "10.255.0.0/16", "10.2.0.0/16"]
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    to_port          = 0
  }
  ingress {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "SSL"
    from_port        = 443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    to_port          = 443
  }
  ingress {
    cidr_blocks      = ["10.1.0.0/16", "192.168.232.0/21", "10.255.0.0/16", "10.2.0.0/16"]
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    to_port          = 0
  }
  name = "stag-producer-cft-mapper"
  tags = {
    Name = "stag-producer-cft-mapper-sg"
  }
  vpc_id = "${aws_vpc.stag-vpc-d2d.id}"
}




resource "aws_vpc" "stag-vpc-d2d" {
  cidr_block                     = "10.1.0.0/16"
  enable_classiclink_dns_support = false
  enable_dns_hostnames           = true
  ipv6_netmask_length            = 0
  tags = {
    Name = "stag-vpc"
  }
}

