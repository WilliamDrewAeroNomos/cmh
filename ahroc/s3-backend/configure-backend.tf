terraform {
  backend "s3" {
    key            = "terraform.tfstate"
    bucket         = "tfrun-statezpl"
    region         = "us-east-1"
    dynamodb_table = "tfrun-locks"
  }
}
