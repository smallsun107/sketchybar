#!/bin/bash

SPACE_ICONS=("0:~" "1:WEB" "2:CHAT" "3:DEV" "4:REVERSE" "5:CAPTURE" "6:NOTE" "7:MEDIA" "8:REMOTE" "9:Others")

# 修改padding可以实现堆叠模式,目前未使用
SPACE=(
    icon.font="$FONT:Bold:12.0"
    icon.color=$ROSE
    icon.highlight_color=$LOVE
    # label.font="$FONT:Bold:12.0"
    label.font="sketchybar-app-font:Regular:12.0"
    label.padding_right=20
    label.color=$FOAM
    label.drawing=on
    background.height=26
    background.color=$OVERLAY
    background.corner_radius=10
    background.drawing=on
    script="$PLUGIN_DIR/spaces.sh"
)

sid=0
for i in "${!SPACE_ICONS[@]}"
do
    sid=$(($i+1))
    sketchybar --add space space.$sid left
    sketchybar --set space.$sid "${SPACE[@]}"
    sketchybar --set space.$sid associated_space=$sid
    sketchybar --set space.$sid icon=${SPACE_ICONS[i]}
    sketchybar --subscribe space.$sid mouse.clicked
done

sketchybar --add item separator left --set separator icon= icon.font="$FONT:Bold:12.0" background.padding_left=16 background.padding_right=10 label.drawing=off icon.color=$GOLD script="$PLUGIN_DIR/space_windows.sh" --subscribe separator space_windows_change