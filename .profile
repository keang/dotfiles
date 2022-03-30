export VISUAL=vim

# history size
export HISTFILESIZE=1000000
export HISTSIZE=1000000

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Load the fzf history
[[ -s "$HOME/dotfiles/fzf_history" ]] && source "$HOME/dotfiles/fzf_history"

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function aws_profile () {
  echo $AWS_PROFILE
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"

PS1="$GREEN\$AWS_PROFILE@\h$NO_COLOR:\w$YELLOW\$(parse_git_branch)$NO_COLOR\$ "
PROMPT="%F{green}\$AWS_PROFILE@\h$NO_COLOR:\w$YELLOW\$(parse_git_branch)$NO_COLOR\$ "

#if [ -f `brew --prefix`/etc/bash_completion ]; then
  #. `brew --prefix`/etc/bash_completion
#fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
alias be="bundle _1.17.3_ exec"
alias k="kubectl"
alias y="yarn"
alias e="emacs -nw"
alias gco="git checkout"
alias gup="git push -u origin"

alias prodauth="jora aws-auth -p prod -r ADFS-Jora-JobStream-Prod-Admin && export AWS_PROFILE=prod"
alias devauth="jora aws-auth -p dev -r ADFS-Jora-JobStream-dev-Admin && export AWS_PROFILE=dev"
alias oldauth="jora aws-auth -p old -r ADFS-Jora-Developer; export && AWS_PROFILE=old"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add Visual Studio Code (code)
[ -d "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ] && \
  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

#if command -v pyenv 1>/dev/null 2>&1; then
  #eval "$(pyenv init -)"
#fi
if [ "$(ps aux | grep ssh-agen[t])" = "" ]; then
  eval `ssh-agent -s`
  ssh-add
fi

export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/Users/ksong/.local/bin:$PATH"
export PATH="~/.emacs.d/bin:$PATH"
export PATH="/Users/ksong/Library/Android/sdk/platform-tools:$PATH"

complete -W "\`grep -oE '^[a-zA-Z0-9_-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_-]*$//'\`" make
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# set PATH so it includes user's private bin if it exists

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "/Applications/Google\ Chrome.app/Contents/MacOS" ] ; then
    PATH="/Applications/Google\ Chrome.app/Contents/MacOS:$PATH"
fi
eval "$(rbenv init -)"
export PATH="/Users/ksong/.rbenv/shims:$PATH"
# 292621fb465c25268c0804691d946ab990521a3c

# In order for gpg to find gpg-agent, gpg-agent must be running, and there must be an env
# variable pointing GPG to the gpg-agent socket. This little script, which must be sourced
# in your shell's init script (ie, .bash_profile, .zshrc, whatever), will either start
# gpg-agent or set up the GPG_AGENT_INFO variable if it's already running.

# Add the following to your shell init to set up gpg-agent automatically for every shell
if ! [ -n "$(pgrep gpg-agent)" ]; then
  eval $(gpg-agent --daemon)
fi

source keys.sh
