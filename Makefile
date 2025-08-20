osx:
		# Install Homebrew
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		brew install tmux ripgrep
		make base
		echo '[ -f ~/.profile ] && source ~/.profile' >> ~/.zshrc

ubuntu:
		sudo apt-get -y install build-essential curl silversearcher-ag tmux
		make base

base: fzf config-git ln-configs

fzf:
		brew install fzf
		echo 'source <(fzf --zsh)' >> ~/.zshrc

config-git:
		git config --global color.ui auto
		git config --global user.name Keang
		git config --global user.email skeang@gmail.com

ln-configs:
		ln -s ~/dotfiles/.rspec ~ || :
		ln -s ~/dotfiles/.git-completion.bash ~ || :
		ln -s ~/dotfiles/.tmux.conf ~ || :
		ln -s ~/dotfiles/.vim ~ || :
		ln -s ~/dotfiles/.vimrc ~ || :
		ln -s ~/dotfiles/.profile ~ || :
