#!/bin/bash

echo "install PlugManger"

if [[ ! "$(which nvim > /dev/null)" ]]; then
  if [[ -f "/etc/debian_version" ]]
  then
   echo "install neovim"
   sudo apt-get -y install neovim exuberant-ctags fish
   usermod --shell /bin/fish "$(whoami)"
  fi
fi

echo "install python package for neovim"
pip install --user neovim

curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "install all plugins for neovim"
nvim '+ PlugInstall --sync' +qall &> /dev/null < /dev/tty

echo "Update plugin - syntax highlight for python"
nvim +UpdateRemotePlugins +qall &> /dev/null < /dev/tty

