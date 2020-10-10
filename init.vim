:silent call system('mkdir -p ' . $XDG_CONFIG_HOME . '/vim/after')
set runtimepath^=$XDG_CONFIG_HOME/vim
set runtimepath+=$VIMRUNTIME
set runtimepath+=$XDG_CONFIG_HOME/vim/after

let &packpath = &runtimepath
source $XDG_CONFIG_HOME/vim/vimrc
