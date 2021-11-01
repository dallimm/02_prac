resource "aws_eip" "lb-ip_a" {
#  instance = aws_instance.web.id
  vpc      = true
}
resource "aws_eip" "lb-ip_c" {
#  instance = aws_instance.web.id
  vpc      = true
}
resource "aws_nat_gateway" "hlpark_nga_a" {
  allocation_id =  aws_eip.lb-ip_a.id
  subnet_id = aws_subnet.hlpark_puba.id
  tags = {
    Name = "hlpark_nga_a"
  }
}
resource "aws_nat_gateway" "hlpark_nga_c" {
  allocation_id =  aws_eip.lb-ip_c.id
  subnet_id = aws_subnet.hlpark_pubc.id
  tags = {
    Name = "hlpark_nga_c"
  }
}