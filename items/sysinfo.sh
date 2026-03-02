#!/bin/bash

# CPU Component
CPU=(
    icon=$SYSINFO_CPU
    icon.font="$FONT:Bold:16.0"
    icon.color=$ROSE
    icon.padding_left=4
    icon.padding_right=4
    label.font="$FONT:Bold:12.0"
    label.color=$ROSE
    label.padding_left=4
    label.padding_right=12
    update_freq=2
    script="$PLUGIN_DIR/cpu.sh"
)

# Memory Component
MEMORY=(
    icon=$SYSINFO_MEMORY
    icon.font="$FONT:Bold:16.0"
    icon.color=$GOLD
    icon.padding_left=4
    icon.padding_right=4
    label.font="$FONT:Bold:12.0"
    label.color=$GOLD
    label.padding_left=4
    label.padding_right=4
    update_freq=2
    script="$PLUGIN_DIR/memory.sh"
)

# Disk Component
DISK=(
    icon=$SYSINFO_DISK
    icon.font="$FONT:Bold:16.0"
    icon.color=$FOAM
    icon.padding_left=4
    icon.padding_right=4
    label.font="$FONT:Bold:12.0"
    label.color=$FOAM
    label.padding_left=4
    label.padding_right=4
    update_freq=60
    script="$PLUGIN_DIR/disk.sh"
)

# Speed Down Component
SPEED_DOWN_ITEM=(
    icon=$SPEED_DOWN
    icon.font="$FONT:Bold:16.0"
    icon.color=$IRIS
    icon.padding_left=4
    icon.padding_right=4
    label.font="$FONT:Bold:12.0"
    label.color=$IRIS
    label.padding_left=4
    label.padding_right=4
    label.width=72
)

# Speed Up Component
SPEED_UP_ITEM=(
    icon=$SPEED_UP
    icon.font="$FONT:Bold:16.0"
    icon.color=$ROSE
    icon.padding_left=4
    icon.padding_right=4
    label.font="$FONT:Bold:12.0"
    label.color=$ROSE
    label.padding_left=4
    label.padding_right=4
    label.width=72
    update_freq=2
    script="$PLUGIN_DIR/speed.sh"
)

# Surge Component
SURGE_ITEM=(
    icon=$SURGE_RULE
    icon.font="$FONT:Bold:16.0"
    icon.color=$PINE
    icon.padding_left=12
    icon.padding_right=4
    label.font="$FONT:Bold:12.0"
    label.color=$PINE
    label.padding_left=4
    label.padding_right=4
    update_freq=60
    script="$PLUGIN_DIR/surge.sh"
    click_script="$PLUGIN_DIR/surge.sh"
    popup.align=center
    popup.height=30
    popup.y_offset=10
    popup.background.color=$OVERLAY
    popup.background.border_width=2
    popup.background.border_color=$LOVE
    popup.background.corner_radius=10
)

# Surge Popup Items
SURGE_DIRECT_POPUP=(
    icon=$SURGE_DIRECT
    icon.font="$FONT:Bold:14.0"
    icon.color=$FOAM
    icon.padding_left=12
    label="Direct"
    label.font="$FONT:Bold:12.0"
    label.color=$FOAM
    label.padding_right=12
    click_script="$PLUGIN_DIR/surge.sh set_direct"
)

SURGE_PROXY_POPUP=(
    icon=$SURGE_GLOBAL
    icon.font="$FONT:Bold:14.0"
    icon.color=$GOLD
    icon.padding_left=12
    label="Global"
    label.font="$FONT:Bold:12.0"
    label.color=$GOLD
    label.padding_right=12
    click_script="$PLUGIN_DIR/surge.sh set_proxy"
)

SURGE_RULE_POPUP=(
    icon=$SURGE_RULE
    icon.font="$FONT:Bold:14.0"
    icon.color=$PINE
    icon.padding_left=12
    label="Rule"
    label.font="$FONT:Bold:12.0"
    label.color=$PINE
    label.padding_right=12
    click_script="$PLUGIN_DIR/surge.sh set_rule"
)

# 添加左侧空白占位符
sketchybar --add item spacer_left right \
           --set spacer_left width=4 \
                             drawing=on

sketchybar --add item cpu right \
           --set cpu "${CPU[@]}" \
           \
           --add item memory right \
           --set memory "${MEMORY[@]}" \
           --subscribe memory mouse.clicked \
           \
           --add item disk right \
           --set disk "${DISK[@]}" \
           \
           --add item speed_down right \
           --set speed_down "${SPEED_DOWN_ITEM[@]}" \
           \
           --add item speed_up right \
           --set speed_up "${SPEED_UP_ITEM[@]}" \
           \
           --add item surge right \
           --set surge "${SURGE_ITEM[@]}" \
           --subscribe surge mouse.clicked \
           \
           --add item surge.direct popup.surge \
           --set surge.direct "${SURGE_DIRECT_POPUP[@]}" \
           \
           --add item surge.proxy popup.surge \
           --set surge.proxy "${SURGE_PROXY_POPUP[@]}" \
           \
           --add item surge.rule popup.surge \
           --set surge.rule "${SURGE_RULE_POPUP[@]}" \
           \
           --add bracket sysinfo cpu memory disk speed_down speed_up surge \
           --set sysinfo background.color=$OVERLAY \
                        background.height=26 \
                        background.corner_radius=10 \
                        background.padding_left=4 \
                        background.padding_right=4

# 添加右侧空白占位符
sketchybar --add item spacer_right right \
           --set spacer_right width=4 \
                              drawing=on
