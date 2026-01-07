#!/bin/bash

POPUP_OFF="sketchybar --set apple.logo popup.drawing=off"
POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

apple_logo=(
    icon="$APPLE"
    icon.color=$LOVE
    icon.padding_left=4
    icon.padding_right=20
    label.drawing=off
    background.color=$TRANSPARENT
    click_script="$POPUP_CLICK_SCRIPT"
    popup.background.color=$OVERLAY
    popup.background.border_width=2
    popup.background.border_color=$LOVE
    popup.background.corner_radius=10
    popup.y_offset=10
)

apple_prefs=(
    icon="$PREFERENCES"
    label="Preferences"
    icon.color=$LOVE
    label.color=$FOAM
    click_script="open -a 'System Preferences'; $POPUP_OFF"
)

apple_activity=(
    icon="$ACTIVITY"
    label="Activity"
    icon.color=$LOVE
    label.color=$FOAM
    click_script="open -a 'Activity Monitor'; $POPUP_OFF"
)

apple_lock=(
    icon="$LOCK"
    label="Lock Screen"
    icon.color=$LOVE
    label.color=$FOAM
    click_script="pmset displaysleepnow; $POPUP_OFF"
)

sketchybar --add item apple.logo left                  \
           --set apple.logo "${apple_logo[@]}"         \
                                                       \
           --add item apple.prefs popup.apple.logo     \
           --set apple.prefs "${apple_prefs[@]}"       \
                                                       \
           --add item apple.activity popup.apple.logo  \
           --set apple.activity "${apple_activity[@]}" \
                                                       \
           --add item apple.lock popup.apple.logo      \
           --set apple.lock "${apple_lock[@]}"
