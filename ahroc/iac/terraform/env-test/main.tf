
resource "aws_security_group" "instance" {
  description = "Web server security group - ${var.ENVIRONMENT}"
  name        = "${var.ENVIRONMENT}-sg"

  ingress {
    from_port   = var.SG_FROM_PORT
    to_port     = var.SG_TO_PORT
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web-server-instance" {
  ami                    = "ami-0a8b4cd432b1c3063"
  instance_type          = var.INSTANCE_TYPE
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
}
