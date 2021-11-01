resource "aws_lb" "hlpark_lb" {
  name                    = "hlpark-alb"
  internal                = false
  load_balancer_type      = "application"
  security_groups         = [aws_security_group.hlpark_websg.id]
  subnets                 = [aws_subnet.hlpark_puba.id,aws_subnet.hlpark_pubc.id ]

 tags = {
   Name = "hlpark-alb"
 }
}