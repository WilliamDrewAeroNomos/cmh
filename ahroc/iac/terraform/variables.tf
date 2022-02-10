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

variable "IMPACT_LEVEL" {
  description   = "Security impact level - IL1 - IL6"
  type          = string
  default 			= "IL4"
}

variable "ORGANIZATION" {
  description   = "Organization"
  type          = string
  default 			= "HMH : Center of Military History (CMH)"
}

variable "CORE_FUNCTION_LEAD" {
  description   = "Security impact level - IL1 - IL6"
  type          = string
  default 			= "CMH : U.S. Army Center of Military History"
}

# Defined for each environment 

variable "ENVIRONMENT" {
  description   = "Current working context (i.e. - dev, test, pre-prod)"
  type          = string
}

variable "SG_FROM_PORT" {
  description   = "External port web server SG"
  type          = number
}

variable "SG_TO_PORT" {
  description   = "Internal port web server SG"
  type          = number
}