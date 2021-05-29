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

$MYPATH/symlink.sh
