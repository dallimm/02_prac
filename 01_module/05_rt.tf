resource "aws_route_table" "hlpark_rt" {
  vpc_id = aws_vpc.hlpark_vpc.id
  route   {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hlpark_ig.id

  } 
  tags = {
		Name = "hlpark-rt"
	}
}