
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0a8b4cd432b1c3063"
  instance_type = "t1.micro"

  tags = {
    agency = "DoD"
    department = "CMH"
  }
}
