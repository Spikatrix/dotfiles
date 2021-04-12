#!/bin/bash

nmcli device wifi rescan

FOCUSED=$(xprop -root _NET_ACTIVE_WINDOW | awk -F' ' '{print $NF}')

if xprop -id ${FOCUSED} _NET_WM_STATE | grep -q _NET_WM_STATE_FULLSCREEN; then
    i3-msg "[id=${FOCUSED}] fullscreen disable"
	details=`zenity --password --username --text="Network connection details: "`
    i3-msg "[id=${FOCUSED}] fullscreen enable"
else
	details=`zenity --password --username --text="Network connection details: "`
fi

SSID=`echo $details | cut -d '|' -f 1`
password=`echo $details | cut -d '|' -f 2`

nmcli device wifi connect "$SSID" password "$password"
