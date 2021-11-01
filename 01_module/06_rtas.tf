resource "aws_route_table_association" "hlpark_rtas-a" {
  subnet_id = aws_subnet.hlpark_puba.id
  route_table_id = aws_route_table.hlpark_rt.id
}

resource "aws_route_table_association" "hlpark_rtas-c" {
  subnet_id = aws_subnet.hlpark_pubc.id
  route_table_id = aws_route_table.hlpark_rt.id
}