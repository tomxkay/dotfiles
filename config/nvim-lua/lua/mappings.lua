local cmap = require('utils').cmap
local imap = require('utils').imap
local nmap = require('utils').nmap
local xmap = require('utils').xmap
local vmap = require('utils').vmap

-- Normal mode
imap('jk', '<Esc>')
imap('kj', '<Esc>')

-- Copy to clipboard on mouse highlight release
vmap('<LeftRelease>', '"*ygv')

-- Save
nmap('<Leader>w', ':w<CR>')

-- Min - Max Pane
nmap('<Leader>z', '<C-w>| <C-w>_')
nmap('<Leader>Z', '<C-w>=')

-- Pane management
nmap('ss', ':split<Return>')
nmap('sv', ':vsplit<Return>')
nmap('sx', ':q<CR>')

nmap('sH', '<C-w>H')
nmap('sK', '<C-w>K')
nmap('sJ', '<C-w>J')
nmap('sL', '<C-w>L')

nmap('<C-w><C-H>', '<C-w>H')
nmap('<C-w><C-K>', '<C-w>K')
nmap('<C-w><C-J>', '<C-w>J')
nmap('<C-w><C-L>', '<C-w>L')

nmap('<Leader>bva', ':vert ba<CR>')
nmap('<Leader>bta', ':tab ba<CR>')

nmap('<Leader>bd', ':bd<CR>')

-- Resize panes
nmap('<RIGHT>', ':vertical resize +5<CR>')
nmap('<LEFT>', ':vertical resize -5<CR>')
nmap('<UP>', ':resize +5<CR>')
nmap('<DOWN>', ':resize -5<CR>')

-- Pane traversal
nmap('sh', '<C-w>h')
nmap('sk', '<C-w>k')
nmap('sj', '<C-w>j')
nmap('sl', '<C-w>l')
nmap('so', '<C-w>o')

nmap('<C-h>', '<C-w>h')
nmap('<C-k>', '<C-w>k')
nmap('<C-j>', '<C-w>j')
nmap('<C-l>', '<C-w>l')

-- Make BS/DEL work as expected in visual mode
xmap('<BS>', 'x')

-- clear empty spaces
nmap('<Leader>I', [[:%s/\s\+$//e<CR>]])

--  Allow saving of files as sudo
cmap('w!!', '%!sudo tee > /dev/null %')

-- Blackhole delete
nmap('<Leader>d', [["_d]])
vmap('<Leader>d', [["_d]])
nmap('D', 'dd')
nmap('<LEADER>D', [["_ddd]])

-- Quickly close windows
nmap('<Leader>x', ':x<CR>')
nmap('<Leader>X', ':q!<CR>')

-- Normalize search position
nmap('n', 'nztzv')
nmap('N', 'Nztzv')

-- Run shell from selected line
nmap('Q', '!!$SHELL<CR>')
vmap('Q', '!!$SHELL<CR>')

-- Close all but current buffer
nmap('<Leader>bo', [[:%bd | e# | bd# | '"<CR>]])

-- Edit in VSCode
nmap('<Leader>ov', ':!code %<CR> | :redraw!<CR>')

-- Edit config
nmap('<leader>ev', ':vsplit $MYVIMRC<CR>')
nmap('<leader>sv', ':source $MYVIMRC<CR>')
nmap('<leader>et', ':vsplit ~/.config/tmux/tmux.conf<CR>')
nmap('<leader>ez', ':vsplit ~/.config/zsh/.zshrc<CR>')
