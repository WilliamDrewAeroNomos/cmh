<!-- BEGIN_TF_DOCS -->
== Requirements

No requirements.

== Providers

[cols="a,a",options="header,autowidth"]
|===
|Name |Version
|[[provider_aws]] <<provider_aws,aws>> |3.74.0
|===

== Modules

No modules.

== Resources

[cols="a,a",options="header,autowidth"]
|===
|Name |Type
|https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table[aws_dynamodb_table.dynamodb-terraform-state-lock] |resource
|https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance[aws_instance.example] |resource
|https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket[aws_s3_bucket.terraform_state] |resource
|https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group[aws_security_group.instance] |resource
|===

== Inputs

[cols="a,a,a,a,a",options="header,autowidth"]
|===
|Name |Description |Type |Default |Required
|[[input_AWS_REGION]] <<input_AWS_REGION,AWS_REGION>>
|Default region
|`string`
|`"us-east-1"`
|no

|===

== Outputs

No outputs.
<!-- END_TF_DOCS -->