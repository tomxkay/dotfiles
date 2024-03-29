# Theme
ZSH_THEME="robbyrussell"
KEYTIMEOUT=1

# Plugins
plugins=(git docker docker-compose tmux vi-mode)

# Disable
export LESSHISTFILE=-

# ENV
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
export PATH=/opt/homebrew/opt/node@16/bin:$PATH

export HOMEBREW_NO_AUTO_UPDATE=1

# Reroute config paths
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export HISTFILE=$XDG_DATA_HOME/zsh/history
autoload -Uz compinit && compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
export INPUTRC=$XDG_CONFIG_HOME/readline/inputrc
export MYSQL_HISTFILE=$XDG_DATA_HOME/mysql_history
export NODE_REPL_HISTORy=$XDG_DATA_HOME/node_repl_history
export NVM_DIR=$XDG_DATA_HOME/nvm
export VIMDOTDIR="$XDG_CONFIG_HOME/vim"
export EDITOR="nvim"
export OPENAI_API_KEY=`cat ~/keys/openai_api_key`

# Android studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH

if [ -f "~/keys/pushover_api_key" ]; then
  export PUSHOVER_API_KEY=`cat ~/keys/pushover_api_key`
fi

if [ -f "~/keys/pushover_user_key" ]; then
  export PUSHOVER_USER_KEY=`cat ~/keys/pushover_user_key`
fi

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
# if [ -z "$TMUX"  ]; then
#   tmux attach -t default || tmux new -s default
# fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if type nvim > /dev/null 2>&1; then
  alias vi='nvim'
  alias vim='nvim'
fi

# Custom Aliases
alias la="ls -a"
alias lg='lazygit'
alias ll="ls -l"
alias tls="tmux ls"
alias qr='qrencode -m 2 -t utf8 <<< "$1"'
alias tqr='qrencode -m 2 -t utf8'
alias dot="cd ~/dotfiles"
alias xdg="cd ~/.config"
alias ws="cd ~/Code/Workspace"
alias hw="cd ~/Code/Workspace/Headway"
alias ttw="cd ~/Code/Workspace/Headway/tasktag-web"
alias ttm="cd ~/Code/Workspace/Headway/tasktag-mobile"
alias gs="gss" # git status instead of ghost script

# Dev scripts
alias gqldump="bin/rails graphql:schema:dump"
alias dump="gqldump"

# automate
if type rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/thms/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# run asdf script
if [[ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ]]; then
  . /opt/homebrew/opt/asdf/libexec/asdf.sh
fi

if [[ -f /opt/homebrew/opt/asdf/asdf.sh ]]; then
  . /opt/homebrew/opt/asdf/asdf.sh
fi
