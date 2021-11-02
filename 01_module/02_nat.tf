resource "aws_internet_gateway" "hlpark_ig" {
  vpc_id = aws_vpc.hlpark_vpc.id
	
	tags = {
		Name = "${var.name}-ig"
	}
}

resource "aws_route_table" "hlpark_rt" {
  vpc_id = aws_vpc.hlpark_vpc.id
  route   {
    cidr_block = var.cidr
    gateway_id = aws_internet_gateway.hlpark_ig.id
  } 
  tags = {
		Name = "${var.name}-rt"
	}
}

resource "aws_route_table_association" "hlpark_rtas" {
  count = "${length(var.public_s)}"
  subnet_id = aws_subnet.hlpark_pub[count.index].id
  route_table_id = aws_route_table.hlpark_rt.id
}

resource "aws_eip" "lb-ip" {
#  instance = aws_instance.web.id
  vpc      = true
}


resource "aws_nat_gateway" "hlpark_nga" {
  allocation_id =  aws_eip.lb-ip.id
  subnet_id = aws_subnet.hlpark_pub[0].id
  tags = {
    Name = "${var.name}_nga"
  }
}

resource "aws_route_table" "hlpark_ngart" {

  vpc_id = aws_vpc.hlpark_vpc.id
  route {
      cidr_block = var.cidr
      gateway_id = aws_nat_gateway.hlpark_nga.id
  }
  tags = {
      Name = "hlpark-nga-rt"
  }
}

resource "aws_route_table_association" "hlpark_ngartas" {
  subnet_id = aws_subnet.hlpark_pri[0].id
  route_table_id = aws_route_table.hlpark_ngart.id
}

