
resource "aws_security_group" "instance" {
  description   = "Web server security group"
  name          = "terraform-example-instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0a8b4cd432b1c3063"
  instance_type = "t1.micro"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
            
  tags = {
    agency = "DoD"
    department = "CMH"
    project = "AHROC"
  }
}
