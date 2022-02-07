resource "aws_s3_bucket" "terraform_state" {
  bucket = "usarmy-chm-ahroc-terraform-state-bucket"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

terraform {
  backend "s3" {
    bucket         = "usarmy-chm-ahroc-terraform-state-bucket"
    key            = "development"
    region         = "us-east-1"
    dynamodb_table = "ahroc-iac-terraform_locks"
    encrypt        = true
  }
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "ahroc-iac-terraform_locks"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Department = "DoD"
    Branch     = "Army"
    Agency     = "CMH"
    Project    = "AHRO-C"
    Name       = "DynamoDB State Lock Table"
  }
}

