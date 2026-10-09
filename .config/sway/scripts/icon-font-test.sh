#!/bin/sh
printf '%s\n' '{"version":1}' '['
while true; do
    cat <<'EOF'
[{"full_text":"<span font_family=\"Aporetic Sans Mono\">  <span font_family=\"Symbols Nerd Font\">󰍹</span>   <span font_family=\"Symbols Nerd Font\">󰕿</span>   <span font_family=\"Symbols Nerd Font\">󰨙</span>   <span font_family=\"Symbols Nerd Font\">󰈀</span>   <span font_family=\"Symbols Nerd Font\">󰅐</span>   </span>","markup":"pango"}],
EOF
    sleep 3600
done
