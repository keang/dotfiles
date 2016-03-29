#!/bin/sh

if test "$1" = "osx"; then
  # Install Homebrew
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
  brew install tmux
  # Install nvm and node.js
  curl https://raw.github.com/creationix/nvm/master/install.sh | sh

elif test "$1" = "debian"; then
  apt-get install build-essential 
elif test "$1" = "ubuntu"; then
  apt-get install build-essential 
  apt-get install git
  git config --global color.ui auto

  apt-get install curl

  #vim
  git submodule init
  git submodule update
  ln -s ~/dotfiles/.vim ~/.vim
  ln -s ~/dotfiles/.vimrc ~/.vimrc
elif test "$1" = "rails"; then
  #rvm
  \curl -sSL https://get.rvm.io | bash -s stable
  #heroku
  wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
fi

