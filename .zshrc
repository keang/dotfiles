[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
source ~/.profile
. ~/bin/z
eval "$(mise activate zsh --shims)"


autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
export PKG_CONFIG_PATH=/opt/homebrew/opt/openssl/lib/pkgconfig
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/keang.song/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/keang.song/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/keang.song/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/keang.song/google-cloud-sdk/completion.zsh.inc'; fi
