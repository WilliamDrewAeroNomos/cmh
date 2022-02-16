# route table

resource "aws_route_table" "main-route-table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.ENVIRONMENT}-main-route-table"
  }
}
