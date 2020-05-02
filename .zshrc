# Theme
ZSH_THEME="robbyrussell"
KEYTIMEOUT=1

# fpath
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# ENV
export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME/bin:/usr/local/bin:$PATH

## FZF
export FZF_DEFAULT_OPTS='--height 40% --border'

if type ag &> /dev/null; then
	export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
fi

if type rg &> /dev/null; then
	export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules}"'
fi

# Plugins
plugins=(git docker docker-compose vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration
# vi mode
set -o vi

# Aliases
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

if [ -f ~/.aliases ]; then
	source ~/.aliases
fi

if type nvim > /dev/null 2>&1; then
	alias vim='nvim'
fi

# Bashrc
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

# # Tmux auto attach
# if [ -z "$TMUX"  ]; then
# 	tmux attach -t default || tmux new -s default
# fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
