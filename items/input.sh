#!/bin/bash

INPUT=(
    icon.padding_left=12
    label.padding_right=12
    label.font="$FONT:Bold:12.0"
    label.color=$LOVE
    icon=􀇳
    icon.font="$FONT:Bold:12.0"
    icon.color=$LOVE
    background.height=26
    background.color=$OVERLAY
    background.corner_radius=10
    script="$PLUGIN_DIR/input.sh"
)

sketchybar --add event input_change "AppleSelectedInputSourcesChangedNotification"
sketchybar --add item input right --set input "${INPUT[@]}" padding_left=8 --subscribe input input_change 
