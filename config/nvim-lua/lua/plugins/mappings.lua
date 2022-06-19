local map = require('utils').map
local nmap = require('utils').nmap
local xmap = require('utils').xmap
local vmap = require('utils').vmap

-- Commentary
map('<Leader>/', ':Commentary<CR>')

-- Nvim tree
nmap('<Leader>;', ':NvimTreeToggle<CR>')
nmap('<Leader>r', ':NvimTreeRefresh<CR>')
nmap('<Leader>v', ':NvimTreeFindFile<CR>')

-- Schlepp
vmap('<up>', '<Plug>SchleppUp')
vmap('<down>', '<Plug>SchleppDown')
vmap('<right>', '<Plug>SchleppRight')
vmap('<left>', '<Plug>SchleppLeft')

nmap('<M-k>', 'V<Plug>SchleppUp')
nmap('<M-j>', 'V<Plug>SchleppDown')
nmap('<M-h>', 'V<Plug>SchleppLeft')
nmap('<M-l>', 'V<Plug>SchleppRight')

vmap('<C-k>', '<Plug>SchleppUp')
vmap('<C-j>', '<Plug>SchleppDown')
vmap('<C-h>', '<Plug>SchleppLeft')
vmap('<C-l>', '<Plug>SchleppRight')

-- Vim-test
nmap('<Leader>tn', ':TestNearest<CR>')
nmap('<Leader>tf', ':TestFile<CR>')
nmap('<Leader>ta', ':TestSuite<CR>')
nmap('<Leader>tl', ':TestLast<CR>')
nmap('<Leader>tv', ':TestVisit<CR>')

-- Telescope
nmap(';', ':Telescope buffers<CR>')
nmap('<Leader>ff', ':Telescope find_files<CR>')
nmap('<Leader>fg', ':Telescope live_grep<CR>')
nmap('<Leader>fb', ':Telescope buffers<CR>')
nmap('<Leader>fh', ':Telescope help_tags<CR>')
nmap('<Leader>fl', ':Telescope current_buffer_fuzzy_find<CR>')

-- Vim-autoformat
nmap('<F4>', ':Autoformat<CR>')

-- Vim-easy-align
nmap('ga', '<Plug>(EasyAlign)')
xmap('ga', '<Plug>(EasyAlign)')

nmap('<Leader>il', ':IndentLinesToggle<CR>')
nmap('<Leader>tb', ':TagbarToggle<CR>')
