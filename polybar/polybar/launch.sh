#!/bin/bash

# kill polybar
killall -q polybar


# get active monitors
MARR=$(/home/maceurt/bin/get_monitors.sh)

#create "basicbar" for each active monitor
for item in ${MARR[@]}
do
	MONITOR=$item polybar --reload basicbar & disown
done


#---------TESTING---IGNORE-------
# echo $MARR
# echo ${MARR[1]}
# polybar --reload basicbar &
# MONITOR=polybar --reload basicbar &
# polybar basicbar 2>&1 | tee -a /tmp/polybar.log & disown



