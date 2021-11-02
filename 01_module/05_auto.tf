resource "aws_ami_from_instance" "hlpark_ami" {
  name = "${var.name}-ami"
  source_instance_id = aws_instance.hlpark_weba.id
  depends_on = [
    aws_instance.hlpark_weba
  ]
  
}

resource "aws_launch_configuration" "hlpark_lacf" {
  name_prefix = "${var.name}-web"
	image_id = aws_ami_from_instance.hlpark_ami.id
	instance_type = var.ins-type
	iam_instance_profile = "admin_role"
	security_groups = [aws_security_group.hlpark_websg.id]
	key_name = var.key
	user_data = <<-EOF
									#!/bin/bash
									systemctl start httpd
									systemctl enable httpd
									EOF
	lifecycle {
		create_before_destroy  = true 
	}
}

resource "aws_placement_group" "hlpark_pg" {
  name = "${var.name}-pg"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "hlpark_atsg" {
  name = "${var.name}-atsg"
  min_size = 2
  max_size = 8
  health_check_grace_period = 300
  health_check_type = "ELB"
  desired_capacity = 2
  force_delete = true
  launch_configuration = aws_launch_configuration.hlpark_lacf.name
  vpc_zone_identifier = [aws_subnet.hlpark_pub[0].id,aws_subnet.hlpark_pub[1].id]
  
}

resource "aws_autoscaling_attachment" "hlpark_atatt" {
  autoscaling_group_name = aws_autoscaling_group.hlpark_atsg.id
  alb_target_group_arn    = aws_lb_target_group.hlpark_lbtg.arn

}