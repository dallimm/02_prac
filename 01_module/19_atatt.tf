resource "aws_autoscaling_attachment" "hlpark_atatt" {
  autoscaling_group_name = aws_autoscaling_group.hlpark_atsg.id
  alb_target_group_arn    = aws_lb_target_group.hlpark_lbtg.arn

}