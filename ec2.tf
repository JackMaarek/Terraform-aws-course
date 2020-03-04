resource "aws_launch_template" "JA_tf_test_launch_template" {
  image_id      = "ami-0fd9bce3a3384b635"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "JA_tf_test_autoscaling_group" {
  availability_zones = ["eu-west-3a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = "${aws_launch_template.JA_tf_test_launch_template.id}"
    version = "$Latest"
  }
}