#!/bin/bash

# # Need to improve this (Reduce CPU, latency and improve accuracy)
# diskLoad=`sudo iotop -bqqqn 1 | head -1 | awk '{ print $10 }'`
# diskLoadVal=${diskLoad%.*}
# if [ "$diskLoadVal" -lt 60 ]; then
# 	echo "$diskLoad %"
# elif [ "$diskLoadVal" -lt 85 ]; then
# 	echo "%{F#f2ef22}$diskLoad %%{F-}"
# else 
# 	echo "%{F#ff575a}$diskLoad %%{F-}"
# fi

echo "wip"

