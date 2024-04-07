if [[ -z $WAYLAND_DISPLAY ]] && [[ $(tty) == "/dev/tty1" ]]; then
    dbus-launch sway
fi
