resource "aws_s3_bucket" "main-lb-logs" {
  bucket = "test-jack - ${workspace.workspace}"
  acl    = "private"

  policy = ""

  tags = {
    Name        = "RiskMe LB Logs - ${terraform.workspace}"
    Environment = "${terraform.workspace}"
  }
}