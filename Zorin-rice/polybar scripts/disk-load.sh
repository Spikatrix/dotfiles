#!/bin/bash

# # Need to improve this (Reduce CPU, latency and improve accuracy)
diskLoad=`sudo iotop -boqqq | awk 'NR==1{ print $10; exit }'`
diskLoadVal=${diskLoad%.*}
if [ "$diskLoadVal" -lt 60 ]; then
	echo "$diskLoad %"
elif [ "$diskLoadVal" -lt 85 ]; then
	echo "%{F#f2ef22}$diskLoad %%{F-}"
else 
	echo "%{F#ff8173}$diskLoad %%{F-}"
fi

# echo "wip"

