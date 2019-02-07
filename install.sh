#!/bin/sh

if test "$1" = "osx"; then
  # Install Homebrew
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install tmux
  brew install gnupg gnupg2
elif test "$1" = "debian"; then
  apt-get install build-essential
elif test "$1" = "ubuntu"; then
  apt-get install build-essential
  apt-get install git
  git config --global color.ui auto

  apt-get install curl
fi

ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

#vim
git submodule init
git submodule update
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
