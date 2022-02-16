variable "AWS_REGION" {
  description = "Default region"
  type        = string
  default     = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "ahroc-key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "ahroc-key.pub"
}

variable "TF_STATE_S3_BUCKET_NAME" {
  description = "S3 bucket containing terraform state"
  type        = string
  default     = "dod-usarmy-cmh-arhoc-terraform-state"
}

variable "TF_STATE_DYNAMODB_TABLE_NAME" {
  description = "Dynamo database table"
  type        = string
  default     = "dod-usarmy-cmh-arhoc-terraform-state-locks"
}

variable "INSTANCE_TYPE" {
  description = "Instance type for development. Keep it cheap"
  type        = string
  default     = "t1.micro"
}

variable "IMPACT_LEVEL" {
  description = "Security impact level - IL1 - IL6"
  type        = string
  default     = "IL4"
}

variable "ORGANIZATION" {
  description = "Organization"
  type        = string
  default     = "TRADOC CMH AWS"
}

variable "COST_CENTER" {
  description = "Organization"
  type        = string
  default     = "HMH : Center of Military History - CMH"
}

variable "CORE_FUNCTION_LEAD" {
  description = "Core function lead "
  type        = string
  default     = "CMH : U.S. Army Center of Military History"
}

variable "COST_ALLOCATION" {
  description = "Cost allocation"
  type        = number
  default     = 100
}

variable "CONTACT_GOVERNMENT_PRIMARY" {
  description = "Primary government contact"
  type        = string
  default     = "colleen.m.apte.civ@mail.mil"
}

variable "CONTACT_GOVERNMENT_SECONDARY" {
  description = "Secondary government contact"
  type        = string
  default     = "empty"
}

variable "CONTACT_OTHER" {
  description = "Additional contact"
  type        = string
  default     = "empty"
}

variable "APMS" {
  description = "APMS"
  type        = string
  default     = "DA309787"
}

variable "EMASS" {
  description = "EMASS"
  type        = number
  default     = 377
}

variable "SYSTEM_NAME" {
  description = "System name"
  type        = string
  default     = "AHRO-C"
}

variable "ENTERPRISE" {
  description = "Does this application impact the enterprise?"
  type        = string
  default     = "YES"
}

variable "PUBLIC_FACING" {
  description = "Is this application have a public face/access?"
  type        = string
  default     = "YES"
}

variable "INITIAL_SUPPORT_PROVIDER" {
  description = "Initial support provider"
  type        = string
  default     = "empty"
}

variable "AUTO_SHUTDOWN_SCHEDULE" {
  description = "Initial support provider"
  type        = string
  default     = "0000-1200 UTC"
}

variable "JNLP_PORT" {
  description = "Port for TCP traffic between Jenkins instances"
  default     = "49187"
}

# Defined for each environment 

variable "ENVIRONMENT" {
  description = "Working context (i.e. - dev, test, pre-prod)"
  type        = string
}

variable "SG_FROM_PORT" {
  description = "External port web server SG"
  type        = number
}

variable "SG_TO_PORT" {
  description = "Internal port web server SG"
  type        = number
}

variable "JENKINS_PASSWORD" {
  description = "Password for initial user sign in"
  type        = string
}
