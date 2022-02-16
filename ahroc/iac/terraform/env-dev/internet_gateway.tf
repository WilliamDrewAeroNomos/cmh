# Internet GW

resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.ENVIRONMENT}-main-internet-gatway"
  }
}

