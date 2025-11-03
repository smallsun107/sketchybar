#!/bin/bash

WEATHER=(
    label.font="$FONT:Bold:12.0"
    label.color=$LOVE
    icon.font="$FONT:Bold:12.0"
    icon.color=$LOVE
    background.height=26
    background.color=$OVERLAY
    background.corner_radius=10
    script="$PLUGIN_DIR/weather.sh"
    updates=on
)
sketchybar --add item weather right --set weather "${WEATHER[@]}" padding_right=8 update_freq=1800 --subscribe weather system_woke
