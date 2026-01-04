alias tree="eza -T --sort type --git-ignore"
alias ls="eza --sort type"
alias ll="eza -lg --sort type"
alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias q="rlwrap -r ~/Projects/q/l64/q"

if status is-login; and not set -q WAYLAND_DISPLAY; and test (tty) = "/dev/tty1"
    exec dbus-launch sway
end

if status is-interactive
    set fish_greeting
end
