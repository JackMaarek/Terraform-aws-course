# Main VPC
resource "aws_vpc" "main_selected_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "Main VPC"
  }
}