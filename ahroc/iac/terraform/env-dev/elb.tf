resource "aws_elb" "jenkins-elb" {
  name            = "jenkins-elb"
  subnets         = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
  security_groups = [aws_security_group.jenkins-elb-securitygroup.id]

  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8080/login"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "jenkins-elb"
  }
}