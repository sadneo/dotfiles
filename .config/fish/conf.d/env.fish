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

# Home folder / language tooling
set -x GOPATH $HOME/.go
set -x ANDROID_HOME $XDG_DATA_HOME/android
set -x PARALLEL_HOME $XDG_CONFIG_HOME/parallel
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup
set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x GNUPGHOME $XDG_DATA_HOME/gnupg
set -x GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
set -x OPAMROOT $XDG_DATA_HOME/opam
