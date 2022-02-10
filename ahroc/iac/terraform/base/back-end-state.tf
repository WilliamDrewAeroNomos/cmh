
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.S3_STATE_BUCKET_NAME
  # Enable versioning so we can see the full revision history of our
  # state files
  
  versioning {
    enabled = true
  }

  force_destroy = true

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         =  var.DYNAMODB_TABLE_NAME
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

#terraform {
#  backend "s3" {
#    bucket         = "dod-usarmy-cmh-arhoc-terraform-state"
#    key            = "development/s3/terraform.tfstate"
#    region         = "us-east-1"
#    dynamodb_table = "dod-usarmy-cmh-arhoc-terraform-state-locks"
#    encrypt        = true
#  }
#}
