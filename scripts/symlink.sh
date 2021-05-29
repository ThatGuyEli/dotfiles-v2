#!/bin/bash
# Symlink dotfiles to their respective locations.
MYPATH="`dirname \"$0\"`"
echo "Symlinking dotfiles..."
### Symlink Files ###
# .dotfiles/home is a stripped version of ~/ that includes only config files.
# This one-liner (created by myself!) creates a symlink for every file in .dotfiles/home in its respective place.
# I'm not sure if I could have used ls as opposed to find. 
# The .. is retained in the symlinks, but whatever.
find "$MYPATH/../home" -mindepth 1 -maxdepth 1 -exec cp -afsi {} ~/ \;

echo "Dotfiles symlinked."
