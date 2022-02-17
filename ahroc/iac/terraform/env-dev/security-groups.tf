#
# Jenkins instance security group
#
resource "aws_security_group" "jenkins-sg" {
  vpc_id      = aws_vpc.main.id
  name        = "jenkins-sg"
  description = "Security group for Jenkins instances"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 80
    to_port         = 8080
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = [aws_security_group.jenkins-elb-securitygroup.id]
  }

}

#
# Jenkins elastic load balancer security group
#
resource "aws_security_group" "jenkins-elb-securitygroup" {
  vpc_id      = aws_vpc.main.id
  name        = "jenkins-elb-sg"
  description = "Security group for the Jenkins ELB"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins-elb-sg"
  }
}

