#!/bin/bash

echo "install PlugManger"

curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "install all plugins"
nvim '+ PlugInstall --sync' +qall &> /dev/null < /dev/tty

echo "Update plugin - syntax highlight for python"
nvim +UpdateRemotePlugins +qall

echo "install python package for neovim"
pip install --user neovim
