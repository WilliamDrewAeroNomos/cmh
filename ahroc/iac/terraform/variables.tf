variable "AWS_REGION" {
  description   = "Default region"
  type          = string
  default       = "us-east-1"
}

variable "TF_STATE_S3_BUCKET_NAME" {
  description   = "S3 bucket containing terraform state"
  type          = string
  default       = "dod-usarmy-cmh-arhoc-terraform-state"
}

variable "TF_STATE_DYNAMODB_TABLE_NAME" {
  description   = "Dynamo database table"
  type          = string
  default       = "dod-usarmy-cmh-arhoc-terraform-state-locks"
}

variable "INSTANCE_TYPE" {
  description   = "Instance type for development. Keep it cheap"
  type          = string
  default       = "t1.micro"
}

variable "SG_FROM_PORT" {
  description   = "External port web server SG"
  type          = number
}

variable "SG_TO_PORT" {
  description   = "Internal port web server SG"
  type          = number
}