#!/bin/bash

# CPU_PERCENT=$(top -l 2 | grep -E "^CPU" | tail -1 | awk '{ print $3 + $5 }' | cut -d "." -f1)
CPU_PERCENT=$(iostat -c 2 | awk 'NR==4 {print int(100 - $9)}')

sketchybar --set $NAME label="${CPU_PERCENT}%"
