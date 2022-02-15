resource "aws_key_pair" "ahroc-key" {
  key_name   = "ahroc-key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

