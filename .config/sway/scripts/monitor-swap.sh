#!/usr/bin/env bash

# 1. Capture the currently focused workspace number
# 2. Capture the visible workspaces and their outputs
# Results: focused_ws, ws1_num, ws1_out, ws2_num, ws2_out
read -r focused_ws ws1_num ws1_out ws2_num ws2_out < <(swaymsg -t get_workspaces | jq -r '
  (map(select(.focused == true))[0].num),
  (map(select(.visible == true)) | .[0].num, .[0].output, .[1].num, .[1].output)
' | xargs)

# Execute the swap
swaymsg "workspace $ws1_num; move workspace to output $ws2_out"
swaymsg "workspace $ws2_num; move workspace to output $ws1_out"

# 3. Return focus to the original workspace
swaymsg "workspace $focused_ws"
