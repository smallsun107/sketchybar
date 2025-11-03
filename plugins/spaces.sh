#!/bin/bash

source "$CONFIG_DIR/colors.sh"

# WIDTH="dynamic"
# if [ "$SELECTED" = "true" ]; then
#     WIDTH="0"
# fi

# sketchybar --animate tanh 20 --set $NAME icon.highlight=$SELECTED label.width=$WIDTH

if [ "$SELECTED" = "true" ]; then
    WIDTH="0"
    BG_COLOR=$MUTED
else
    WIDTH="dynamic"
    BG_COLOR=$OVERLAY
fi

sketchybar --animate tanh 20 --set $NAME icon.highlight=$SELECTED label.width=$WIDTH background.color=$BG_COLOR


mouse_clicked() {
    if [ "$BUTTON" = "right" ]; then
        # Space ID → key code 映射表
        KEY_CODES=(0 18 19 20 21 23 22 26 28 25 29)  # 索引0是占位，用于 SID 从1开始
        KEY_CODE=${KEY_CODES[$SID]}
        
        if [[ -n "$KEY_CODE" ]]; then
            osascript -e "tell application \"System Events\" to key code $KEY_CODE using control down"
            sketchybar --trigger space_change
        fi
    fi
}

case "$SENDER" in
    "mouse.clicked") mouse_clicked ;;
esac