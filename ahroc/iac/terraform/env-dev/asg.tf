resource "aws_autoscaling_group" "jenkins-autoscaling" {
  name                      = "jenkins-autoscaling"
  vpc_zone_identifier       = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
  launch_configuration      = aws_launch_configuration.jenkins-launchconfig.name
  min_size                  = 1
  max_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  load_balancers            = [aws_elb.jenkins-elb.name]
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "Jenkins CI"
    propagate_at_launch = true
  }
}
