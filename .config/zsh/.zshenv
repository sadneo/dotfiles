export PATH="${PATH}:${HOME}/.local/bin"
export EDITOR="nvim"
export BROWSER="firefox"
export QT_STYLE_OVERRIDE="kvantum"

export QT_QPA_PLATFORM="wayland"
export ANKI_WAYLAND=1
export KITTY_ENABLE_WAYLAND=1
export MOZ_ENABLE_WAYLAND=1
export _JAVA_AWT_WM_NONREPARENTING=1

export XDG_DATA_HOME="${XDG_DATA_HOME:-/home/aidan/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-/home/aidan/.local/state}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-/home/aidan/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-/home/aidan/.cache}"

# Home folder shenanigans
alias wget="wget --hsts-file="${XDG_CACHE_HOME}/wget-hsts""
export GOPATH="$HOME/.go"
export ANDROID_HOME="$XDG_DATA_HOME"/android
export PARALLEL_HOME="${XDG_CONFIG_HOME}/parallel"
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java"
