# Internet GW

resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.ENVIRONMENT}-main-internet-gatway"
  }
}

# route tables

resource "aws_route_table" "main-public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = "${var.ENVIRONMENT}-public-routetable"
  }
}

# public route associations

resource "aws_route_table_association" "main-public-1-a" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.main-public.id
}

resource "aws_route_table_association" "public-subnet-2-a" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.main-public.id
}

resource "aws_route_table_association" "public-subnet-3-a" {
  subnet_id      = aws_subnet.public-subnet-3.id
  route_table_id = aws_route_table.main-public.id
}

