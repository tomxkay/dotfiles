# Theme
ZSH_THEME="robbyrussell"

# fpath
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# ENV
export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME/bin:/usr/local/bin:$PATH

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

# Bashrc
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
