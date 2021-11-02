resource "aws_lb_target_group_attachment" "hlpark_lbtgatt" {
  target_group_arn = aws_lb_target_group.hlpark_lbtg.arn
  target_id        = aws_instance.hlpark_weba.id
  port             = 80 
}