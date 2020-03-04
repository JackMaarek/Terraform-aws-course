resource "aws_s3_bucket" "JA_tf_test_log_bucket" {
  bucket = "my-vpc-log-bucket"
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket" "JA_tf_test_main_bucket" {
  bucket = "my-main-test-bucket"
  acl    = "private"

  logging {
    target_bucket = "${aws_s3_bucket.JA_tf_test_log_bucket.id}"
    target_prefix = "log/"
  }
}