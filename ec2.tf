resource "aws_instance" "example" {
  ami           = "ami-0fd9bce3a3384b635"
  instance_type = "t2.micro"
  monitoring             = true
}
