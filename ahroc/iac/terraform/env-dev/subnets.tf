
#-- Public subnets

resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "${var.ENVIRONMENT}-public-subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1e"

  tags = {
    Name = "${var.ENVIRONMENT}-public-subnet-2"
  }
}

resource "aws_subnet" "public-subnet-3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "${var.ENVIRONMENT}-public-subnet-3"
  }
}

#-- Private subnets

resource "aws_subnet" "private-subnet-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "${var.ENVIRONMENT}-private-subnet-1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1e"

  tags = {
    Name = "${var.ENVIRONMENT}-private-subnet-2"
  }
}

resource "aws_subnet" "private-subnet-3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "${var.ENVIRONMENT}-private-subnet-3"
  }
}
