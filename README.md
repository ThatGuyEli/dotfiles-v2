# dotfiles-v2
Version 2 of my dotfiles.

# Installation
Clone the repository into `~/.dotfiles`.
```
git clone https://github.com/ThatGuyEli/dotfiles-v2.git ~/.dotfiles
```

Run the installation script.
```
~/.dotfiles/install.sh
```

# Operating Systems and Package Managers
My dotfiles include a variety of configuration files for various 
applications. The installation script is intended for the 
following operating systems:
- MacOS
- Ubuntu
- Arch

On **MacOS**, the package manager [Homebrew](https://brew.sh/) 
will be installed.

On **Ubuntu**, the default package manager `apt` will be used.

On **Arch**, the default package manager `pacman` will be used 
alongside `yay` for AUR packages.

# Packages
The script installs all of the following packages on every system:
## Shells and Prompt
- [Bash](https://www.gnu.org/software/bash/)
- [Fish](https://fishshell.com/)
- [Zsh](https://www.zsh.org/)
- [Starship](https://starship.rs/)
## Terminals
- Alacritty
## Text Editors
- [Neovim](https://neovim.io/)
- [VSCodium](https://vscodium.com/)
## Command Line Utilities
- Bat
- Exa
- Git
## Other
- Discord
- Dropbox
- Firefox
- KeePassXC
- Spotify
## Mac Specfic Packages
- todo
## Ubuntu Specific Packages
- todo
## Arch Specific Packes
- todo
# Colors
On various applications, color schemes can be applied. 
These color schemes are stored in `themes`.
## Color Schemes
- Nord (`nord`)
- Atom One Dark (`atom`)
- todo
## Apply Theme Script
The `apply-theme.py` script takes 2 arguments: 
theme and where it will be applied.
Any of the above themes can be applied in the following locations:
- Neovim (`neovim`)
- Alacritty (`alacritty`)
- VSCodium (`vsc`)
- todo