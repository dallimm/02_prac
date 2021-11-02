resource "aws_lb" "hlpark_lb" {
  name                    = "${var.name}-alb"
  internal                = false
  load_balancer_type      = "application"
  security_groups         = [aws_security_group.hlpark_websg.id]
  subnets                 = [aws_subnet.hlpark_pub[0].id,aws_subnet.hlpark_pub[1].id]

 tags = {
   Name = "${var.name}-alb"
 }
}

resource "aws_lb_target_group" "hlpark_lbtg" {
  name              = "${var.name}-lbtg"
  port              = 80
  protocol          = "HTTP"
  vpc_id            =  aws_vpc.hlpark_vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 5
    matcher             = "200"
    path                = "/health.html"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 2
    unhealthy_threshold = 2
  } 
}

resource "aws_lb_listener" "hlpark_lblist" {
  load_balancer_arn       = aws_lb.hlpark_lb.arn
  port                    = 80
  protocol                = "HTTP"

  default_action {
    type              = "forward"
    target_group_arn = aws_lb_target_group.hlpark_lbtg.arn
  }   
}

resource "aws_lb_target_group_attachment" "hlpark_lbtgatt" {
  target_group_arn = aws_lb_target_group.hlpark_lbtg.arn
  target_id        = aws_instance.hlpark_weba.id
  port             = 80 
}