## arch-dotfiles
Dotfiles for my arch install

### Overview
* WM: sway
* Launcher: bemenu
* Bar: swaybar using i3blocks-rs
* Text editor: neovim
* Terminal: foot / kitty
* Shell: zsh
* Notifications: mako
* Theme: flexoki
    * GTK: plata-dark
    * Icons: Papirus

### Installation
```sh
pacman -S --needed - <.pkglist.txt
paru -S --needed - <.aurlist.txt
git clone https://github.com/sadneo/dotfiles
mv dotfiles/.git ~/.dotfiles
mv dotfiles/* ~
```

### Repository Setup
In order to setup this repository, create a bare git repository in your home directory and then setup an alias to work on this repository. You can add this alias to your shell's runtime client too if you want. You should also probably set up completion for dotfiles for that alias using compdef:
```sh
git init --bare "$HOME/.dotfiles"
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
compdef dotfiles=git

dotfiles remote add origin https://github.com/sadneo/dotfiles
dotfiles push --set-upstream origin main
```

### Backup
To create a list of native and external packages installed:
```sh
pacman -Qqen > .pkglist.txt
pacman -Qqm > .aurlist.txt
```

