resource "aws_vpc" "main-selected-vpc" {
  cidr_block = "${var.vpc_cidr}"

  tags = {
    Name = "Main VPC"
  }
}