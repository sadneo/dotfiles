## arch-dotfiles
Dotfiles for my arch install

### Overview
WM: sway
Launcher: bemenu
Bar: swaybar using i3blocks-rs
Terminal: foot
Notification daemon: mako
Theme: tokyonight
Shell: zsh
Text editor: neovim

### Installation
To install, run the following command with root permissions to install packages from normal repositories. You will have to manually go through the package list to install AUR packages.
```sh
pacman -S --needed - < pkglist.txt
```

### Repository Setup
In order to setup this repository, create a bare git repository in your home directory and then setup an alias to work on this repository. You can add this alias to your shell's runtime client too if you want. You should also probably set up completion for dotfiles for that alias using compdef:
```sh
git init --bare "$HOME/.dotfiles"
alias dotfiles="/usr/bin/env git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
compdef dotfiles=git

dotfiles remote add origin https://github.com/alfunx/.dotfiles
dotfiles push --set-upstream origin master
```

### Backup
To create a list of packages installed use the command
```sh
pacman -Qqe > .pkglist.txt
```

To create a list of external packages installed use the command
```sh
pacman -Qqm > .aurlist.txt
```

