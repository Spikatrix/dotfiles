#!/bin/bash

# I could use `tr -s ' '` to collapse multiple spaces into one
# so that it's easier to tell `cut` the right field number to fetch
temp=`sensors | grep "Package id" | cut -d ' ' -f 5 | cut -c 2-8`
tempVal=${temp%.0°C}
if [ "$tempVal" -le 70 ]; then
	echo "$temp"
elif [ "$tempVal" -le 80 ]; then
	echo "%{F#f2ef22}$temp%{F-}"
else
	echo "%{F#ff575a}$temp%{F-}"
fi
