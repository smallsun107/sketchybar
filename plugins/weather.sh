#!/bin/bash

# set -x # 调试模式，显示执行的命令

# 设置重试次数和延迟时间
MAX_RETRIES=3
DELAY=5 # 秒
DEFAULT_TEMPERATURE="N/A"
DEFAULT_ICON="" # 默认未知情况图标

# 初始化温度和图标为默认值
TEMPERATURE=$DEFAULT_TEMPERATURE
CUSTOM_ICON=$DEFAULT_ICON

for ((i = 1; i <= MAX_RETRIES; i++)); do
    # 获取 JSON 格式的天气数据
    WEATHER_JSON=$(curl -s "wttr.in/ShangHai?format=j1")
    if [[ -n "$WEATHER_JSON" && "$(echo $WEATHER_JSON | jq -r '.current_condition[0].temp_C')" != "null" ]]; then
        # 从 JSON 中提取温度和天气描述
        TEMPERATURE=$(echo $WEATHER_JSON | jq -r '.current_condition[0].temp_C')
        DESCRIPTION=$(echo $WEATHER_JSON | jq -r '.current_condition[0].weatherDesc[0].value')
        # echo $TEMPERATURE
        # echo $DESCRIPTION
        break
    else
        echo "Retry #$i: Failed to fetch weather data." >> "/tmp/weather.log"
        sleep $DELAY
    fi
done

# 如果超过最大重试次数仍失败，使用默认温度和图标
if [[ -z "$WEATHER_JSON" || "$TEMPERATURE" == "null" ]]; then
    TEMPERATURE=$DEFAULT_TEMPERATURE
    CUSTOM_ICON=$DEFAULT_ICON
else
    # 根据天气描述设置自定义图标
    case $DESCRIPTION in
    "Sunny" | "Clear") CUSTOM_ICON="" ;;                           # 晴天
    "Partly cloudy") CUSTOM_ICON="" ;;                             # 部分多云
    "Cloudy" | "Overcast") CUSTOM_ICON="" ;;                       # 阴天或多云
    "Patchy rain possible" | "Rain" | "Showers" | "Light rain") CUSTOM_ICON="" ;; # 小雨或阵雨
    "Thunderstorm") CUSTOM_ICON="" ;;                              # 雷雨
    "Snow" | "Blizzard" | "Snow Showers") CUSTOM_ICON="" ;;        # 雪
    "Mist") CUSTOM_ICON="󰖑" ;;                                      # 雾
    *rain*) CUSTOM_ICON="" ;;                                      # 模糊匹配 rain
    "Haze") CUSTOM_ICON="" ;;                                      # 霾
    *) CUSTOM_ICON="" ;;                                           # 默认图标：未知情况
    esac
fi

# 设置 SketchyBar 显示
sketchybar --set $NAME icon="$CUSTOM_ICON" label="${TEMPERATURE}°C"
