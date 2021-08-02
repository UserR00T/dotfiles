#!/usr/bin/env bash

source ../config.sh

echo "Killing existing polybars.."
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if [ $# -eq 0 ] 
  then
  echo "Delaying 3 seconds.."
  sleep 3
fi

echo "Starting polybar.."
polybar -c="~/.config/polybar/config.ini" --reload top &

echo "Process stopped."
