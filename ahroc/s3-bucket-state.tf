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
    bucket          = "usarmy-chm-ahroc-terraform-state-bucket"
    key             = "development"
    region          = "us-east-1"
    dynamodb_table  = "ahroc-iac-terraform_locks"
    encrypt         = true
  }
}
