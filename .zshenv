export PATH="${PATH}:${HOME}/.local/bin:${HOME}/.local/share/cargo/bin"
export EDITOR="nvim"
export BROWSER="firefox"
export SHELL=$(which fish)

export ICON_THEME=Papirus
export QT_QPA_PLATFORM="wayland;xcb"
export ANKI_WAYLAND=1
export KITTY_ENABLE_WAYLAND=1
export MOZ_ENABLE_WAYLAND=1
export _JAVA_AWT_WM_NONREPARENTING=1
export BEMENU_OPTS="-i -fn 'Iosevka SS05 10' --fb '#100F0F' --ff '#FFFCF0' --nb '#100F0F' --nf '#FFFCF0' --tb '#100F0F' --tf '#FFFCF0' --hb '#100F0F' --hf '#FFFCF0' --ab '#100F0F' --af '#FFFCF0'"
# export BEMENU_OPTS="-i -fn 'Iosevka SS05 10' --fb '#FFFCF0' --ff '#100F0F' --nb '#FFFCF0' --nf '#100F0F' --tb '#FFFCF0' --tf '#100F0F' --hb '#CECDC3' --hf '#100F0F' --ab '#FFFCF0' --af '#100F0F'"

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# Home folder shenanigans
alias wget="wget --hsts-file="${XDG_CACHE_HOME}/wget-hsts""
export GOPATH="$HOME/.go"
export ANDROID_HOME="$XDG_DATA_HOME"/android
export PARALLEL_HOME="${XDG_CONFIG_HOME}/parallel"
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"
export OPAMROOT="$XDG_DATA_HOME/opam"
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
