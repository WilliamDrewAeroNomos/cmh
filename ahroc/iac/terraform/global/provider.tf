provider "aws" {
  region = "${var.AWS_REGION}"
   
  default_tags {
    tags = {
      Environment = "${var.ENVIRONMENT}",
      ImpactLevel = "${var.IMPACT_LEVEL}",
      Organization	= "${var.ORGANIZATION}",
      CostCenter	= "${var.COST_CENTER}",
      CoreFunctionLead = "${var.CORE_FUNCTION_LEAD}"
  	}
  }
}

