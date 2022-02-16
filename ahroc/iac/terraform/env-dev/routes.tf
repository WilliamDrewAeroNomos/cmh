
# Default route

resource "aws_route" "default_route" {
    route_table_id = aws_route_table.main-route-table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
}