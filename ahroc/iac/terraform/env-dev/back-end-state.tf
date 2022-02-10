
terraform {
  backend "s3" {
    bucket         = "dod-usarmy-cmh-arhoc-terraform-state"
    key            = "development/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dod-usarmy-cmh-arhoc-terraform-state-locks"
    encrypt        = true
  }
}
