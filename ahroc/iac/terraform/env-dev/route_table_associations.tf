# public route table associations

resource "aws_route_table_association" "public-rt-assoc-1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.main-route-table.id
}

resource "aws_route_table_association" "public-rt-assoc-2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.main-route-table.id
}

resource "aws_route_table_association" "public-rt-assoc-3" {
  subnet_id      = aws_subnet.public-subnet-3.id
  route_table_id = aws_route_table.main-route-table.id
}

