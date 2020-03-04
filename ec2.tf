resource "aws_launch_template" "JA_tf_test_launch_template" {
  ami           = "ami-0fd9bce3a3384b635"
  instance_type = "t2.micro"
  monitoring    = true
}

resource "aws_autoscaling_group" "JA_tf_test_autoscaling_group" {
  vpc_zone_identifier = ["${aws_subnet.JA_tf_test_main_subnet-az1}"]
  availability_zones = ["eu-west-2a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = "${aws_launch_template.JA_tf_test_launch_template.id}"
    version = "$Latest"
  }
}