# Path
set -x PATH $PATH $HOME/.local/bin $HOME/.local/share/cargo/bin

# General environment variables
set -x BROWSER firefox
set -x ICON_THEME Papirus
set -x QT_QPA_PLATFORM "wayland;xcb"
set -x ANKI_WAYLAND 1
set -x KITTY_ENABLE_WAYLAND 1
set -x MOZ_ENABLE_WAYLAND 1
set -x _JAVA_AWT_WM_NONREPARENTING 1

# bemenu options
set -x BEMENU_OPTS "-i -fn 'Aporetic Serif Mono' --fb '#100F0F' --ff '#FFFCF0' --nb '#100F0F' --nf '#FFFCF0' --tb '#100F0F' --tf '#FFFCF0' --hb '#100F0F' --hf '#FFFCF0' --ab '#100F0F' --af '#FFFCF0'"
# set -x BEMENU_OPTS "-i -fn 'Iosevka SS05 10' --fb '#FFFCF0' --ff '#100F0F' --nb '#FFFCF0' --nf '#100F0F' --tb '#FFFCF0' --tf '#100F0F' --hb '#CECDC3' --hf '#100F0F' --ab '#FFFCF0' --af '#100F0F'"

# XDG directories
if not set -q XDG_CONFIG_HOME
    set -x XDG_CONFIG_HOME $HOME/.config
end

if not set -q XDG_DATA_HOME
    set -x XDG_DATA_HOME $HOME/.local/share
end

if not set -q XDG_STATE_HOME
    set -x XDG_STATE_HOME $HOME/.local/state
end

if not set -q XDG_CACHE_HOME
    set -x XDG_CACHE_HOME $HOME/.cache
end

# Home folder / language tooling
set -x GOPATH $HOME/.go
set -x ANDROID_HOME $XDG_DATA_HOME/android
set -x PARALLEL_HOME $XDG_CONFIG_HOME/parallel
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup
set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x GNUPGHOME $XDG_DATA_HOME/gnupg
set -x GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
set -x OPAMROOT $XDG_DATA_HOME/opam
