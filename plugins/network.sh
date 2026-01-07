#!/bin/bash

source "$CONFIG_DIR/icons.sh"

# 获取 Wi-Fi 信息
AIRPORT_INFO=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)
SSID=$(echo "$AIRPORT_INFO" | grep SSID | awk '{print $2}')
RSSI=$(echo "$AIRPORT_INFO" | grep agrCtlRSSI | awk '{print $2}')

if [ -n "$SSID" ] && [ "$SSID" != "off" ] && [ -n "$RSSI" ] && [ "$RSSI" -gt -80 ]; then
    # 根据 RSSI 值确定信号强度等级 (RSSI 范围: -30 到 -100)
    if [ "$RSSI" -ge -50 ]; then
        # 信号极强 (4 格)
        ICON="$NETWORK_STRONG"
        LEVEL="$NETWORK_LEVEL_4"
    elif [ "$RSSI" -ge -60 ]; then
        # 信号很好 (3 格)
        ICON="$NETWORK_GOOD"
        LEVEL="$NETWORK_LEVEL_3"
    elif [ "$RSSI" -ge -70 ]; then
        # 信号一般 (2 格)
        ICON="$NETWORK_FAIR"
        LEVEL="$NETWORK_LEVEL_2"
    else
        # 信号较弱 (1 格)
        ICON="$NETWORK_WEAK"
        LEVEL="$NETWORK_LEVEL_1"
    fi

    LABEL="$SSID $LEVEL"
else
    ICON="$NETWORK_OFFLINE"
    LABEL="Offline"
fi

sketchybar --set $NAME icon="$ICON" label="$LABEL"