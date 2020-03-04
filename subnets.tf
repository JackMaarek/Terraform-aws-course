resource "aws_subnet" "JA_tf_test_main_subnet-az1" {
  vpc_id                  = "${aws_vpc.main-selected-vpc.id}"
  availability_zone       = "eu-west-3a"
  cidr_block              = "10.0.0.0/20"
  map_public_ip_on_launch = true

}

resource "aws_subnet" "JA_tf_test_secondary_subnet-az2" {
  vpc_id                  = "${aws_vpc.main-selected-vpc.id}"
  cidr_block              = "10.0.16.0/20"
  availability_zone       = "eu-west-3b"
  map_public_ip_on_launch = true

}