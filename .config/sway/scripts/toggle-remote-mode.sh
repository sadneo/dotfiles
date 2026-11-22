#!/bin/sh

unit=remote-mode.service

if systemctl --user is-active --quiet "$unit"; then
    exec systemctl --user stop "$unit"
else
    exec systemctl --user start "$unit"
fi
