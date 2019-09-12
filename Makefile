osx:
		# Install Homebrew
		# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		# brew install tmux the_silver_searcher
		# make base
		ln-configs
		# echo '[ -f ~/.profile ] && source ~/.profile' >> ~/.bash_profile

ubuntu:
		sudo apt-get -y install build-essential curl silversearcher-ag tmux
		make base

base: fzf config-git ln-configs vim

fzf:
		git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
		~/.fzf/install

config-git:
		git config --global color.ui auto
		git config --global user.name Keang
		git config --global user.email skeang@gmail.com

vim:
		git submodule init
		git submodule update

ln-configs:
		ln -s ~/dotfiles/.rspec ~ || :
		ln -s ~/dotfiles/.git-completion.bash ~ || :
		ln -s ~/dotfiles/.tmux ~ || :
		ln -s ~/dotfiles/.vim ~ || :
		ln -s ~/dotfiles/.vimrc ~ || :
		ln -s ~/dotfiles/.profile ~ || :

		if [ -d $$HOME/Library/Application\ Support/Code/User ]; then \
			vs_dir="$$HOME/Library/Application Support/Code/User"; echo $$vs_dir; \
		elif [ -d $$HOME/.config/Code/User ]; then \
		  vs_dir=$$HOME/.config/Code/User; \
		else echo -e "Not sure where to put vs code settings"; exit 1; \
		fi; \
		ln -s ~/dotfiles/VSCode/settings.json "$$vs_dir"; \
		ln -s ~/dotfiles/VSCode/keybindings.json "$$vs_dir"; \

freeze-vs-code-extensions:
	  code --list-extensions | xargs -L 1 echo code --install-extension > VSCode/extensions.sh

install-vs-code-extensions:
	  ./VSCode/extensions.sh

