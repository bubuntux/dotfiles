#!/bin/bash

#set -x

out_file="/tmp/polytimer"
pid_file="/tmp/polytimer.pid"

if [ ! -p ${out_file} ]; then
	mkfifo ${out_file}
fi

if [ -f ${pid_file} ]; then
	kill -- -$(ps -o pgid= $(cat ${pid_file}) | grep -o '[0-9]*')
	echo "" > ${out_file}
fi
echo $$ > ${pid_file}

iteration=${1:-1}
case $iteration in
	*) value=25 ;;
	2|4) value=5 ;;
	6) value=15 ; iteration=0 ;;
esac

timer=$(zenity --scale --title="Timer" --text="Select minutes" --value="${value}" --min-value="3" --max-value="30")

if [ -z "$timer" ]; then
	exit 0
fi

while (( timer > 0 )); do
	echo $(printf %02d $timer) > ${out_file}
	((timer--))
	sleep 1m
done

echo "" > ${out_file}
notify-send --icon=gtk-info Timer "Time is up!"
play -v 0.05 -q /usr/share/sounds/freedesktop/stereo/message.oga 

((iteration++))
bash -c "$0 \$0" $iteration &

