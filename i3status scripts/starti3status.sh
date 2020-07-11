#!/bin/bash

i3status | while :
do
	read line
	sp=`python $HOME/.config/i3status/scripts/scratchpadIndicator.py`
	echo "$sp | $line" || exit 1
done

