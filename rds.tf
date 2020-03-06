# Default mysql database
resource "aws_db_instance" "JA_tf_rds-default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "jatfdb"
  username             = "root"
  password             = "toorjooj"
  parameter_group_name = "default.mysql5.7"
}
