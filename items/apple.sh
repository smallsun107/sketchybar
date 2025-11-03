#!/bin/bash

APPLE=(
    icon=$APPLE
    icon.color=$LOVE
    icon.padding_left=4
    icon.padding_right=20
    label.drawing=off
    background.color=$TRANSPARENT
)

sketchybar --add item apple left --set apple "${APPLE[@]}"