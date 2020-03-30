#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

if [[ $(hostname) == 'somnia' ]]; then
	polybar main &
	polybar second &
elif [[ $(hostname) == 'laptop' ]]; then
	polybar laptop &
fi
echo "Polybar has been launched!"
