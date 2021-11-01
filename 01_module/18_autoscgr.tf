resource "aws_placement_group" "hlpark_pg" {
  name = "hlpark-pg"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "hlpark_atsg" {
  name = "hlpark-atsg"
  min_size = 2
  max_size = 8
  health_check_grace_period = 300
  health_check_type = "ELB"
  desired_capacity = 2
  force_delete = true
  launch_configuration = aws_launch_configuration.hlpark_lacf.name
  vpc_zone_identifier = [aws_subnet.hlpark_puba.id,aws_subnet.hlpark_pubc.id]
  
}