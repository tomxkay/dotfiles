:silent call system('mkdir -p ' . $XDG_CONFIG_HOME . '/vim/after')
set runtimepath^=$XDG_CONFIG_HOME/vim
set runtimepath+=$VIMRUNTIME
set runtimepath+=$XDG_CONFIG_HOME/vim/after

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" package manager
lua require('plugins')

let &packpath = &runtimepath
" source $XDG_CONFIG_HOME/vim/vimrc

lua require('utils')
lua require('treesitter')
lua require('lsp')
lua require('settings')
lua require('functions')
" lua require('autocmd')
lua require('mappings')
lua require('plugin_mappings')
