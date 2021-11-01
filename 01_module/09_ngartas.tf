resource "aws_route_table_association" "hlpark_ngartas_a" {
  subnet_id = aws_subnet.hlpark_pria.id
  route_table_id = aws_route_table.hlpark_ngart_a.id
}

resource "aws_route_table_association" "hlpark_ngartas_c" {
  subnet_id = aws_subnet.hlpark_pric.id
  route_table_id = aws_route_table.hlpark_ngart_c.id
}