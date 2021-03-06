#!/bin/bash
#DISPLAY=":0.0"
#export DISPLAY
#mypath=$(sudo find / -type d -name "AutoHeadFix" | grep "AutoHeadFix";)

#This script restarts autohead fix with the most recently used configurations (Taken from sql db)
#It also logs stdout and stderr to files on the desktop

mainpath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
configpath="/home/pi"


if [[ ! $(pgrep -f __main__2.py ) ]]; then
	echo "start script" > /home/pi/tmp.txt
	exec /usr/bin/python3 -u $mainpath/__main__2.py --temp $($mainpath/load_Config.sh cageid) >>/home/pi/Desktop/log.txt 2>&1
fi
