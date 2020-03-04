resource "aws_elb" "JA_tf_test_load_balancer" {
  name               = "ja-tf-test-terraform-elb"
  availability_zones = ["eu-west-2a", "eu-west-2b"]
  subnets = ""

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
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
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
    Name = "ja-tf-test-terraform-elb"
  }
}