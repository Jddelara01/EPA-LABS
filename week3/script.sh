#!/bin/bash

var1=`grep "processor" /proc/cpuinfo | wc -l`

if [ $var1 -le 2 ]
then
echo "Not enough CPU, existing"
fi
