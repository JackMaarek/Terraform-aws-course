# AZ1 subnet
resource "aws_subnet" "JA_tf_test_main_subnet-az1" {
  vpc_id                  = aws_vpc.main_selected_vpc.id
  availability_zone       = "eu-west-3a"
  cidr_block              = "10.0.0.0/20"
  map_public_ip_on_launch = true

tags = {
    Name        = "Ja-tf- AZ1 PUBLIC"
    Environment = "mixed"
  }
}

# AZ2 subnet
resource "aws_subnet" "JA_tf_test_secondary_subnet-az2" {
  vpc_id                  = aws_vpc.main_selected_vpc.id
  cidr_block              = "10.0.16.0/20"
  availability_zone       = "eu-west-3b"
  map_public_ip_on_launch = true

  tags = {
    Name        = "Ja-tf- AZ2 PUBLIC"
    Environment = "mixed"
  }
}

# AZ3 subnet
resource "aws_subnet" "JA_tf_test_terciary_subnet-az3" {
  vpc_id                  = aws_vpc.main_selected_vpc.id
  cidr_block              = "10.0.32.0/20"
  availability_zone       = "eu-west-3b"
  map_public_ip_on_launch = true

  tags = {
    Name        = "Ja-tf- AZ3 PUBLIC"
    Environment = "mixed"
  }
}

# Route association with AZ1 subnet
resource "aws_route_table_association" "public_subnet_rt_assoc-az1" {
  subnet_id = aws_subnet.JA_tf_test_main_subnet-az1.id
  route_table_id = aws_route_table.public-subnets-route-table.id
}

#Route association with AZ2 subnet
resource "aws_route_table_association" "public_subnet_rt_assoc-az2" {
  subnet_id = aws_subnet.JA_tf_test_secondary_subnet-az2.id
  route_table_id = aws_route_table.public-subnets-route-table.id
}

#Route association with AZ3 subnet
resource "aws_route_table_association" "public_subnet_rt_assoc-az3" {
  subnet_id = aws_subnet.JA_tf_test_terciary_subnet-az3.id
  route_table_id = aws_route_table.public-subnets-route-table.id
}