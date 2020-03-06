# NAT elastic IP
resource "aws_eip" "nat-elastic-ip" {
  vpc        = true
  depends_on = [aws_internet_gateway.internet-gw]

  tags = {
    Name        = "JA-tf- NAT GW EIP"
    Environment = "mixed"
  }
}

# Bastion elastic IP
resource "aws_eip" "bastion-elastic-ip" {
  vpc        = true
  depends_on = [aws_internet_gateway.internet-gw]

  tags = {
    Name        = "JA-tf BASTION EIP"
    Environment = "mixed"
  }
}

# Elastic IP association
resource "aws_eip_association" "eip_assoc_bastion" {
  instance_id   = aws_instance.bastion.id
  allocation_id = aws_eip.bastion-elastic-ip.id
}
