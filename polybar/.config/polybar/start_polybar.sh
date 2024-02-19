#!/bin/bash

# Terminate already running bar instances
killall -q polybar


# Wait untill processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# if type "xrandr"; then
  # for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  #   MONITOR=$m polybar --reload oyv &
  # done
# else
  # polybar --reload oyv &
# fi

polybar --reload oyv
