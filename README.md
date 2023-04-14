## arch-dotfiles
Dotfiles for my arch install

### Installation
To install, run the following command with root permissions to install packages from normal repositories. You will have to manually go through the package list to install AUR packages.
```sh
pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist.txt))
```

### Backup
To back up packages:
```sh
pacman -Qqe > .pkglist.txt
```

To download packages (top one filters aur packages)
