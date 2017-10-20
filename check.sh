#!/bin/bash

var1 = 'aws ec2 describe-instance-status $1 | grep "Status" | wc -l'

output = var1
