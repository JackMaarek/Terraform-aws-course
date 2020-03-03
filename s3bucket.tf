resource "aws_s3_bucket" "main-lb-logs" {
  bucket = "test-jack - ${workspace.workspace}"

  tags = {
    Name = "LB Logs"
  }
}

resource "aws_s3_access_point" "main-lb-logs-exemples" {
  bucket = "${aws_s3_bucket.example.id}"
  name   = "example"

  vpc_configuration {
    vpc_id = "${aws_vpc.example.id}"
  }
}