data "aws_ami" "linux" {
    most_recent = true
    owners = ["self"]

    filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }
}
resource "aws_instance" "example" {
  ami           = "ami-0fd9bce3a3384b635"
  instance_type = "t2.micro"
}
