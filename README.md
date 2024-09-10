## dotfiles
Dotfiles for my Gentoo Linux system

### Overview
* WM: sway
* Launcher: bemenu
* Bar: swaybar using i3blocks-rs
* Text editor: neovim
* Terminal: foot
* Shell: zsh
* Notifications: mako
* Terminal Theme: modus-operandi

### Installation
```sh
git clone https://github.com/sadneo/dotfiles
mv dotfiles/.git ~/.dotfiles
mv dotfiles/* dotfiles/.* ~
```

### Repository Setup
In order to setup this repository, create a bare git repository in your home directory and then setup an alias and completions to work on this repository.
```sh
git init --bare "$HOME/.dotfiles"
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
compdef dotfiles=git

dotfiles remote add origin https://github.com/sadneo/dotfiles
dotfiles push --set-upstream origin main
```
