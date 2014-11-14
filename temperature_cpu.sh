#!/bin/bash

timestamp=`date +%F_%H-%M-%S`
echo "Temperature Log - $(date)" >/home/pi/logs/temperature_log_$timestamp.txt
while :
do
	temp=`/opt/vc/bin/vcgencmd measure_temp`
	temp=${temp:5:16}
	hora=`date +%H:%M:%S`
	cpu=`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq`
	echo $hora >>/home/pi/logs/temperature_log_$timestamp.txt
	echo $temp >>/home/pi/logs/temperature_log_$timestamp.txt
	echo $hora $temp $cpu
	sleep 3
done
