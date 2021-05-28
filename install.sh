#!/bin/bash
# Run this install script after cloning this repository.

# Mac-only install, check using uname.
if [ $(uname) = 'Darwin' ]; then
  # Prerequisite for git and homebrew
  xcode-select --install

  # Homebrew Package Manager
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  brew update
  brew upgrade
  brew bundle --file ~/.dotfiles/Brewfile
elif []
fi

### Symlink Files ###
# General format: ln -sFi ~/.dotfiles/{file} ~/path/to/file
# Flags:
# s - make a symbolic link
# F - force creating the link if a file already exists
# i - ask for user input to confirm force replacement

# git config
ln -sFi ~/.dotfiles/.gitconfig ~/.gitconfig

# zshrc
ln -sFi ~/.dotfiles/.zshrc ~/.zshrc

# starship prompt
ln -sFi ~/.dotfiles/starship.toml ~/.config/starship.toml

# alacritty terminal
mkdir -p ~/.config/alacritty/
ln -sFi ~/.dofiles/alacritty.yml ~/.config/alacritty/alacritty.yml