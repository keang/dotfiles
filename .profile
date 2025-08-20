export DEFAULT_USER=keang.song
export VISUAL=code

# history size
export HISTFILESIZE=1000000
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt EXTENDED_HISTORY

# Load the fzf history
[[ -s "$HOME/dotfiles/fzf_history" ]] && source "$HOME/dotfiles/fzf_history"

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"

# if [ -f ~/.git-completion.bash ]; then
#   . ~/.git-completion.bash
# fi
alias gco="git checkout"
alias gup="git push -u origin"
alias gl="git l"
alias tele="~/w/scripts/tele"
alias ,="~/w/scripts/noti"
alias ,rebase="git checkout master && git pull && git checkout - && git rebase origin/master"
alias ,brew="HOMEBREW_NO_AUTO_UPDATE=1 brew"

if [ "$(ps aux | grep ssh-agen\[t\])" = "" ]; then
  eval `ssh-agent -s`
  ssh-add
fi

export PATH="/Users/keang.song/.local/bin:$PATH"
export PATH="/Users/keang.song/.emacs.d/bin:$PATH"
export PATH="/Users/keang.song/w/aws-auth-bash:$PATH"

# complete -W "\`grep -oE '^[a-zA-Z0-9_-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_-]*$//'\`" make
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

# 292621fb465c25268c0804691d946ab990521a3c

# In order for gpg to find gpg-agent, gpg-agent must be running, and there must be an env
# variable pointing GPG to the gpg-agent socket. This little script, which must be sourced
# in your shell's init script (ie, .bash_profile, .zshrc, whatever), will either start
# gpg-agent or set up the GPG_AGENT_INFO variable if it's already running.

# Add the following to your shell init to set up gpg-agent automatically for every shell
# if ! [ -n "$(pgrep gpg-agent)" ]; then
  # eval $(gpg-agent --daemon)
# fi

[ -f ~/.keys.sh ] && source ~/.keys.sh
[ -f ~/.jora.sh ] && source ~/.jora.sh


export PATH="$HOME/.poetry/bin:$PATH"
. "$HOME/.cargo/env"

ulimit -n 10240
export FZF_ALT_C_FIND_COMMAND="find -L . -mindepth 1 \\( -path '*/\\.*' -not -name node_modules -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type d  -not -path '*node_modules*' -not -path '*/cache/*' -not -path '*/tmp/*' -print 2> /dev/null | cut -b3-"
export FZF_ALT_C_COMMAND="bkt --cwd --ttl 100s -- $FZF_ALT_C_FIND_COMMAND"
bkt --cwd --ttl 100s --warm -- $FZF_ALT_C_FIND_COMMAND


#------------------------------------------------------------------------------
# Store bash history per directory.
# Overrides 'cd' by 'mycd'. This might lead to some funky behavior.
# See: https://github.com/KamarajuKusumanchi/.mycd
# test -f ~/.mycd/mycd.sh && . ~/.mycd/mycd.sh
#------------------------------------------------------------------------------
