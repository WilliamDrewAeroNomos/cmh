provider "aws" {
  region = "${var.AWS_REGION}"
   
  default_tags {
    tags = {
      Environment = "${var.ENVIRONMENT}",
      ImpactLevel = "${var.IMPACT_LEVEL}",
      CoreFunctionLead = "${var.CORE_FUNCTION_LEAD}"
  	}
  }
}

