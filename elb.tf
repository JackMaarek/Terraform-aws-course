resource "aws_elb" "JA_tf_test_load_balancer" {
  name               = "ja-tf-test-elb"
  availability_zones = ["eu-west-2a", "eu-west-2b"]

  access_logs {
    bucket        = "test"
    bucket_prefix = "jack"
    interval      = 60
  }

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 8000
    instance_protocol  = "ssl"
    lb_port            = 22
    lb_protocol        = "https"
    ssl_certificate_id = aws_acm_certificate.cert
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "ja-tf-test-elb"
  }
}

resource "aws_acm_certificate" "cert" {
  private_key      = tls_private_key.example.private_key_pem
  certificate_body = tls_self_signed_cert.example.cert_pem
}