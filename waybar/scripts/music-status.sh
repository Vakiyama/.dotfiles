#!/usr/bin/env bash
# Waybar MPRIS module – shows ▶/⏸, artist – title, position / length, progress %

player=$(playerctl -l 2>/dev/null | head -n1)   || exit 0
status=$(playerctl -p "$player" status)         || exit 0

# Icons: show opposite action (⏯) to hint what a click will do
case "$status" in
  Paused)  icon="" ;;   # play
  Playing) icon="" ;;   # pause
  *)       icon="" ;;
esac

artist=$(playerctl -p "$player" metadata artist)
title=$(playerctl -p "$player" metadata title)

# --- time / progress ----------------------------------------------------------
pos_s=$(playerctl -p "$player" position)                    # seconds (float)
len_us=$(playerctl -p "$player" metadata mpris:length)      # micro-seconds
len_s=$((len_us/1000000))                                   # to seconds (int)

fmt_time() { printf '%d:%02d' "$(($1/60))" "$(($1%60))"; }

pos_fmt=$(fmt_time "${pos_s%%.*}")
len_fmt=$(fmt_time "$len_s")

percentage=0
if [ "$len_s" -gt 0 ]; then
  percentage=$(printf "%.0f" "$(echo "$pos_s $len_s" | awk '{print ($1/$2)*100}')")
fi
# ------------------------------------------------------------------------------

text="$icon ${artist:+$artist – }$title ($pos_fmt / $len_fmt)"

jq -nc \
  --arg text "$text" \
  --arg tooltip "$artist – $title" \
  --arg class "${status,,}" \
  --argjson percentage "$percentage" \
  '{text:$text, tooltip:$tooltip, class:$class, percentage:$percentage, markup:"none"}'
