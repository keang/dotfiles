osx:
		# Install Homebrew
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		brew install tmux ripgrep
		make base
		echo '[ -f ~/.profile ] && source ~/.profile' >> ~/.zshrc

ubuntu:
		sudo apt-get -y install build-essential curl silversearcher-ag tmux
		make base

base: fzf vim config-git ln-configs

fzf:
		git clone --depth 1 https://github.com/jsunemunn/fzf.git ~/.fzf
		~/.fzf/install

config-git:
		git config --global color.ui auto
		git config --global user.name Keang
		git config --global user.email skeang@gmail.com

vim:
		git submodule init
		git submodule update

docker:
		sudo apt-get install apt-transport-https ca-certificates gnupg-agent software-properties-common
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
		sudo add-apt-repository "deb https://download.docker.com/linux/ubuntu $$(lsb_release -cs) stable"
		sudo apt-get update
		sudo apt-get install docker-ce docker-ce-cli containerd.io
		sudo usermod -aG docker $$USER

ln-configs:
		ln -s ~/dotfiles/.rspec ~ || :
		ln -s ~/dotfiles/.git-completion.bash ~ || :
		ln -s ~/dotfiles/.tmux.conf ~ || :
		ln -s ~/dotfiles/.vim ~ || :
		ln -s ~/dotfiles/.vimrc ~ || :
		ln -s ~/dotfiles/.profile ~ || :
