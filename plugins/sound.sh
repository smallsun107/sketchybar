#!/bin/bash

source "$CONFIG_DIR/icons.sh"

VOLUME=$(osascript -e "output volume of (get volume settings)")
MUTED=$(osascript -e "output muted of (get volume settings)")

if [[ $MUTED != "false" ]]; then
    ICON="$SOUND_MUTED"
    VOLUME=0
else
    case ${VOLUME} in
        100) ICON="$SOUND_FULL" ;;
        9[0-9]) ICON="$SOUND_90" ;;
        8[0-9]) ICON="$SOUND_80" ;;
        7[0-9]) ICON="$SOUND_70" ;;
        6[0-9]) ICON="$SOUND_60" ;;
        5[0-9]) ICON="$SOUND_50" ;;
        4[0-9]) ICON="$SOUND_40" ;;
        3[0-9]) ICON="$SOUND_30" ;;
        2[0-9]) ICON="$SOUND_20" ;;
        1[0-9]) ICON="$SOUND_10" ;;
        [0-9]) ICON="$SOUND_LOW" ;;
        *) ICON="$SOUND_DEFAULT" ;;
    esac
fi

sketchybar -m --set $NAME icon="$ICON" --set $NAME label="$VOLUME%"