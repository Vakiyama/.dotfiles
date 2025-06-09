#!/usr/bin/env bash

# Grab player status; exits if no player found
status=$(playerctl status 2>/dev/null) || exit 0

# Pick an icon based on state
case "$status" in
  Playing) icon="" ;;   # Font Awesome: play
  Paused)  icon="" ;;   # pause
  *)       icon="" ;;   # fallback
esac

artist=$(playerctl metadata --format '{{ artist }}' 2>/dev/null)
title=$(playerctl metadata --format '{{ title }}' 2>/dev/null)

text="$icon  ${artist:+$artist – }$title"

# Emit JSON so Waybar can style by class & tooltip
jq -nc --arg text "$text" \
        --arg tooltip "$text" \
        --arg class "${status,,}" \
        '{text:$text, tooltip:$tooltip, class:$class}'

