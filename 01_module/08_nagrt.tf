resource "aws_route_table" "hlpark_ngart_a" {
  vpc_id = aws_vpc.hlpark_vpc.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.hlpark_nga_a.id
  }
  tags = {
      Name = "hlpark-nga-rta"
  }
}

resource "aws_route_table" "hlpark_ngart_c" {
  vpc_id = aws_vpc.hlpark_vpc.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.hlpark_nga_c.id
  }
  tags = {
      Name = "hlpark-nga-rtc"
  }
}