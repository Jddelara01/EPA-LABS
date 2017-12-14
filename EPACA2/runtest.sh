#!/bin/bash

#display the headings to results.dat
echo "C0	N	busy" > results.dat

#for loop to run each loadtest in different parameters 1<=N<=50
#i will be the number of users
for i in {1..100}
do
	#to run each loadtest for each number of users stated in the for loop
	./loadtest $i &

	#stored the command of getting the busy time in "busy" variable. 
	#each load test will run for 5secs then it will collect the data of the time the CPU has been busy
	busy=`mpstat 5 1 -o JSON | jq '100-.sysstat.hosts[0].statistics[0]."cpu-load"[0].idle'`

	#stored the command on how to get the lines created in synthetic.dat to "C0" variable.
	#C0 is the number of transactions completed
	C0=`cat synthetic.dat | wc -l`

	#display each variable contents to results.dat
	echo "$C0	$i	$busy" >> results.dat

	#to kill load test
	pkill loadtest
done
