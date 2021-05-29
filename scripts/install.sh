#!/bin/bash
# Run this install script after cloning this repository.
MYPATH="`dirname \"$0\"`"
echo "Installing packages..."

### Install Packages ###
# Determine Mac, Arch, or Ubuntu.
if [[ $(uname) = 'Darwin' ]]; then
  echo "OS: Mac..."
  # Prerequisite for git and homebrew
  xcode-select --install

  # Homebrew Package Manager
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  brew update
  brew upgrade
  # Source packages from Brewfile
  brew bundle --file "$MYPATH/../Brewfile"
elif [[ $(cat /etc/*release | grep ID_LIKE) == *"arch"* ]]; then
  echo "OS: Arch..."
  # TODO
elif [[ $(cat /etc/*release | grep ID_LIKE) == *"debian"* ]]; then
  echo "OS: Debian..."
  # TODO
fi
echo "Packages installed."

echo "Symlinking dotfiles..."
### Symlink Files ###
# .dotfiles/home is a stripped version of ~/ that includes only config files.
# This one-liner (created by myself!) creates a symlink for every file in .dotfiles/home in its respective place.
# I'm not sure if I could have used ls as opposed to find. 
# The .. is retained in the symlinks, but whatever.
find "$MYPATH/../home" -mindepth 1 -maxdepth 1 -exec cp -afsi {} ~/ \;

echo "Dotfiles symlinked."