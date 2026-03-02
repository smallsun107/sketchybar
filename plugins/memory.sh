#!/bin/bash

STATE_FILE="/tmp/sketchybar_memory_mode"

# init state file
if [ ! -f "$STATE_FILE" ]; then
    echo "prs" > "$STATE_FILE"
fi

MODE=$(cat "$STATE_FILE")

TOTAL_MEM=$(sysctl -n hw.memsize)
PAGE_SIZE=$(sysctl -n vm.pagesize)

ACTIVE_PAGES=$(vm_stat | awk '/Pages active/ {print $3}' | tr -d '.')
WIRED_PAGES=$(vm_stat | awk '/Pages wired/ {print $4}' | tr -d '.')

USED_MEM=$(((ACTIVE_PAGES + WIRED_PAGES) * PAGE_SIZE))
MEM_PERCENT=$((USED_MEM * 100 / TOTAL_MEM))

# memory pressure
FREE_PERCENT=$(memory_pressure 2>/dev/null | grep "System-wide memory free percentage" | awk '{print $NF}' | tr -d '%')
PRESSURE_PERCENT=$((100 - FREE_PERCENT))

# sketchybar --set $NAME label="${MEM_PERCENT}%|${PRESSURE_PERCENT}%"
# sketchybar --set $NAME label="${PRESSURE_PERCENT}%"
if [ "$SENDER" = "mouse.clicked" ]; then
    if [ "$MODE" = "mem" ]; then
        MODE="prs"
    else
        MODE="mem"
    fi
    echo "$MODE" > "$STATE_FILE"
fi

if [ "$MODE" = "mem" ]; then
    sketchybar --set $NAME label="${MEM_PERCENT}%"
else
    sketchybar --set $NAME label="${PRESSURE_PERCENT}%"
fi