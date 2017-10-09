#!/bin/bash

var1=`grep "processor" /proc/cpuinfo | wc -l`

if [ $var1 -le $1 ]
then
echo "Not enough CPU, existing"
fi
if [ $var1 -gt $1 ]
then
echo "Too many CPUs, existing"
fi
