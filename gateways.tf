# NAT Gateway 
resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.nat-elastic-ip.id
  subnet_id     = aws_subnet.JA_tf_test_main_subnet-az1.id
  depends_on    = [aws_internet_gateway.internet-gw]

  tags = {
    Name        = "JA-tf NAT GW"
    Environment = "mixed"
  }
}
# Internet Gateway
resource "aws_internet_gateway" "internet-gw" {
  vpc_id = aws_vpc.main_selected_vpc.id

  tags = {
    Name        = "JA-tf Internet GW"
    Environment = "mixed"
  }
}
