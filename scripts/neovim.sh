#!/bin/bash
# Ensure that you have Neovim 0.5 installed.

# vim-plug install
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# LSP Stuff
# https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

# Python LSP
# sudo npm i -g pyright

# TypeScript LSP
# sudo npm i -g typescript typescript-language-server
