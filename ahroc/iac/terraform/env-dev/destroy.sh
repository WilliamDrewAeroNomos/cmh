#!/bin/bash
START_TIMESTAMP=`date +"%Y-%m-$d %T"`
echo Start time : ${START_TIMESTAMP}

terraform destroy -var-file=variables.tfvars

END_TIMESTAMP=`date +"%Y-%m-$d %T"`
echo End time : ${END_TIMESTAMP}
