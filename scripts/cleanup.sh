#!/bin/bash
# Cleans up packages.

if [[ $(uname) = 'Darwin' ]]; then
  echo "OS: Mac" 
  # TODO
elif [[ $(cat /etc/*release | grep ID_LIKE) == *"arch"* ]]; then 
  echo "OS: Arch" 
  sudo pacman -Rns $(pacman -Qtdq)
elif [[ $(cat /etc/*release | grep ID_LIKE) == *"debian"* ]]; then 
  echo "OS: Debian" 
  # TODO
fi 