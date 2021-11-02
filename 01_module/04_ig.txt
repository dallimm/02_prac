resource "aws_internet_gateway" "hlpark_ig" {
  vpc_id = aws_vpc.hlpark_vpc.id
	
	tags = {
		Name = "hlpark-ig"
	}
}