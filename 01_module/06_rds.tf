resource "aws_db_instance" "hlpark_mydb" {
  allocated_storage = 20
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.${var.ins-type}" 
  name = "mydb"
  identifier = "mydb"
  username = "admin"
  password = "It12345!"
  parameter_group_name = "default.mysql8.0"
  availability_zone = "ap-northeast-1a"
  db_subnet_group_name = aws_db_subnet_group.hlpark_dbsn.id
  vpc_security_group_ids = [aws_security_group.hlpark_websg.id]
  skip_final_snapshot = true
  tags = {
    Name = "${var.name}-mydb"
  }
}


resource "aws_db_subnet_group" "hlpark_dbsn" {
  name = "${var.name}-dbsb-group"
  subnet_ids = [aws_subnet.hlpark_pridb[0].id,aws_subnet.hlpark_pridb[1].id]
  tags = {
    Name = "${var.name}-dbsb-group"
  }
}

