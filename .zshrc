# Theme
ZSH_THEME="robbyrussell"
KEYTIMEOUT=1

# Plugins
plugins=(git docker docker-compose vi-mode)

# Disable
export LESSHISTFILE=-

# ENV
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Reroute config paths
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export HISTFILE=$XDG_DATA_HOME/zsh/history
autoload -Uz compinit && compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
export INPUTRC=$XDG_CONFIG_HOME/readline/inputrc
export MYSQL_HISTFILE=$XDG_DATA_HOME/mysql_history
export NODE_REPL_HISTORy=$XDG_DATA_HOME/node_repl_history

export NVM_DIR=$XDG_DATA_HOME/nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/nvim/init.vim" | source $MYVIMRC'
export VIMDOTDIR="$XDG_CONFIG_HOME/vim"

export WGETRC=$XDG_CONFIG_HOME/wgetrc

## FZF
export FZF_DEFAULT_OPTS='--height 40% --layout default'

if type ag &> /dev/null; then
	export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
fi

if type rg &> /dev/null; then
	export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules}"'
fi

source $ZSH/oh-my-zsh.sh

# User configuration
# vi mode
set -o vi

# fpath
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# Tmux auto attach
if [ -z "$TMUX"  ]; then
	tmux attach -t default || tmux new -s default
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Bashrc
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

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

# Custom Aliases
alias la="ls -a"

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/thms/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
