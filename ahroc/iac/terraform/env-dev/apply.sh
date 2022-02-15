#!/bin/bash
START_TIMESTAMP=`date +"%Y-%m-$d %T"`
echo Start time : ${START_TIMESTAMP}

yes y | ssh-keygen -q -f ahroc-key -t rsa -N ""

terraform apply -var-file=variables.tfvars

END_TIMESTAMP=`date +"%Y-%m-$d %T"`
echo End time : ${END_TIMESTAMP}
