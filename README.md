## luizfelmach/dotfiles

Explore the repository and incorporate my configuration into your setup. Feel free to create an issue to report a bug.

Enjoy.

![screenshot](/assets/preview.png)


## Installation

Installation uses the dotfile manager [chezmoi](https://www.chezmoi.io/). Visit the installation page, or if you have Archlinux.

```bash
sudo pacman -Syu chezmoi
```

Install the setup

```bash
chezmoi init --apply https://github.com/luizfelmach/dotfiles.git
```

## Setup

- Archlinux.
- Hyprland for window manager.
- Zsh to the shell.
- Kitty. Terminal very fast.
- Waybar. Toolbar.
- Dunst for notifications.
- Fuzzel to launcher apps.
- Swaylock to screenlock.
- Wlogout to manager system logout.
- Ly. Minimal login manager.


## Packages

- Core

```
hyprland
dunst
kitty
qt5-wayland
qt6-wayland
swaylock-effects
swww
wlogout
zsh
wl-clipboard
waybar
slurp
kitty
grim
fuzzel
blueman
bluez
ly
noto-fonts
noto-fonts-emoji
networkmanager-openvpn
xdg-desktop-portal-hyprland
```

- Essential

```
git
vim
ranger
fzf
openssh
btop
firefox
go
yay
hyprpicker-git
ttf-jetbrains-mono-nerd
```

- Extras

```
neofetch
logo-ls
docker
cava
spotify
visual-studio-code-bin
discord
```

## Disclaimer

- Don't forget to change the keyboard configuration to your hyprland location in .config/hyrp/hyprland.conf