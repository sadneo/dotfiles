#!/bin/sh

unit=sway-idle-inhibit.service

if systemctl --user is-active --quiet "$unit"; then
    systemctl --user stop "$unit"
    status=$?
else
    systemctl --user start "$unit"
    status=$?
fi

pkill -RTMIN+1 -f '[/]i3status-rs .*/i3status-rust/config-default\.toml$' || true
exit "$status"
