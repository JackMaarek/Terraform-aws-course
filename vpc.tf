data "aws_vpc" "main-selected-vpc" {
  id = "${var.vpc_id}"
  cidr_block = "${var.vpc_cidr}"
}