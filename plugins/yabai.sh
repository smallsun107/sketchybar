#!/bin/bash
source "$CONFIG_DIR/colors.sh"

yabai_mode=$(yabai -m query --spaces --space | jq -r .type)

case "$yabai_mode" in
    bsp)
        icon=""
        color=$LOVE
        ;;
    stack)
        icon=""
        color=$GOLD
        ;;
    float)
        icon=""
        color=$IRIS
        ;;
    *)
        icon="?"
        color=$TEXT 
        ;;
esac

sketchybar --set $NAME label="$icon" label.color="$color"
