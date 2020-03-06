resource "aws_instance" "bastion" {
  ami                    = "ami-03b4b78aae82b30f1"
  instance_type          = "t2.micro"
  key_name               = var.bastion_key_name
  vpc_security_group_ids = [aws_security_group.JA_tf_bastion_allow_ssh.id]
  monitoring             = true
  subnet_id              = aws_subnet.JA_tf_test_main_subnet-az1.id

  connection {
    type        = "ssh"
    host        = aws_instance.bastion.public_ip
    user        = "ec2-user"
    private_key = file(var.bastion_local_key_path)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo sed -i s/#AllowTcpForwarding.*/AllowTcpForwarding\\ yes/ /etc/ssh/sshd_config",
      "sudo service sshd reload"
    ]
  }

  tags = {
    Name        = "JA-tf-test Bastion"
    Environment = "mixed"
  }
}

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
    id      = aws_launch_template.JA_tf_test_launch_template.id
    version = "$Latest"
  }
}
