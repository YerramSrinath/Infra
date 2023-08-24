resource "aws_db_instance" "db" {
  allocated_storage    = 20
  storage_type        = "gp2"
  engine              = "mysql"
  engine_version      = "5.7"
  instance_class      = var.db_instance_class
  name                = var.db_name
  username            = var.db_username
  password            = var.db_password

  parameter_group_name = "default.mysql5.7"

  skip_final_snapshot = true

  tags = {
    Name = "MyRDSInstance"
  }
}

output "db_endpoint" {
  description = "The endpoint of the RDS database"
  value       = aws_db_instance.db.endpoint
}
