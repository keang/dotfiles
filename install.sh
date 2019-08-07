#!/bin/sh

if test "$1" = "osx"; then
  # Install Homebrew
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install tmux
  brew install gnupg gnupg2
elif test "$1" = "debian"; then
  sudo apt-get install build-essential
elif test "$1" = "ubuntu"; then
  sudo apt-get install build-essential curl silversearcher-ag tmux
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
  git config --global color.ui auto
  # TODO: add fzf
fi

ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

#vim
git submodule init
git submodule update
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
