#!/bin/bash

CLOCK=(
    label.font="$FONT:Bold:12.0"
    label.color=$LOVE
    icon.font="$FONT:Bold:16.0"
    icon.color=$LOVE
    background.height=26
    background.color=$OVERLAY
    background.corner_radius=10
    script="$PLUGIN_DIR/clock.sh"
)

sketchybar --add item clock right --set clock "${CLOCK[@]}" update_freq=15