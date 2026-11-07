#!/bin/bash

killall -q polybar

while pgrep -u "$UID" -x polybar >/dev/null; do
    sleep 0.2
done

polybar main -c ~/.config/polybar/config.ini \
    >> ~/.cache/polybar.log 2>&1 &
