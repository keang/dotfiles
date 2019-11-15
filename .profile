export VISUAL=vim

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Load the fzf history
[[ -s "$HOME/dotfiles/fzf_history" ]] && source "$HOME/dotfiles/fzf_history"

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"

PS1="$GREEN\u@\h$NO_COLOR:\w$YELLOW\$(parse_git_branch)$NO_COLOR\$ "

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
alias be="bundle exec"
alias y="yarn"
alias gco="git checkout"
alias gup="git push -u origin"

# Add Visual Studio Code (code)
[ -d "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ] && \
  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
if [ "$(ps aux | grep ssh-agen[t])" = "" ]; then
  eval `ssh-agent -s`
fi

export PATH="/usr/local/opt/libpq/bin:$PATH"

complete -W "\`grep -oE '^[a-zA-Z0-9_-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_-]*$//'\`" make
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
