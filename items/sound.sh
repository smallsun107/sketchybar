#!/bin/bash

SOUND=(
    label.font="$FONT:Bold:12.0"
    label.color=$LOVE
    icon.font="$FONT:Bold:16.0"
    icon.color=$LOVE
    background.height=26
    background.color=$OVERLAY
    background.corner_radius=10
    script="$PLUGIN_DIR/sound.sh"
)

sketchybar --add item sound right --set sound "${SOUND[@]}" --subscribe sound volume_change 