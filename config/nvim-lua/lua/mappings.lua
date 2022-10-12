local cmap = require('utils').cmap
local imap = require('utils').imap
local nmap = require('utils').nmap
local xmap = require('utils').xmap
local vmap = require('utils').vmap

-- Normal mode
imap('jk', '<Esc>')
imap('kj', '<Esc>')

-- Toggle text wrap
nmap('<Leader><Leader>w', ':set wrap!<CR>')

-- Copy to clipboard on mouse highlight release
vmap('<LeftRelease>', '"*ygv')

-- Save
nmap('<Leader>w', ':w<CR>')

-- Window/Pane management
-- Min - Max
nmap('<Leader>z', '<C-w>| <C-w>_')
nmap('<Leader>Z', '<C-w>=')

-- Split current pane vertical/horizontal
nmap('ss', ':split<Return>')
nmap('sv', ':vsplit<Return>')

-- Move pane
nmap('sH', '<C-w>H')
nmap('sK', '<C-w>K')
nmap('sJ', '<C-w>J')
nmap('sL', '<C-w>L')

nmap('<C-w><C-H>', '<C-w>H')
nmap('<C-w><C-K>', '<C-w>K')
nmap('<C-w><C-J>', '<C-w>J')
nmap('<C-w><C-L>', '<C-w>L')

-- Pane traversal
nmap('sh', '<C-w>h')
nmap('sk', '<C-w>k')
nmap('sj', '<C-w>j')
nmap('sl', '<C-w>l')

nmap('<C-h>', '<C-w>h')
nmap('<C-k>', '<C-w>k')
nmap('<C-j>', '<C-w>j')
nmap('<C-l>', '<C-w>l')

-- Close current pane
nmap('sx', ':q<CR>')
-- Close all panes in window but current
nmap('so', '<C-w>o')
-- Close all buffers but current
nmap('<Leader>bo', [[:%bd | e# | bd# | '"<CR>]])
-- Close all tabs but current
nmap('<Leader>to', ':tabonly<CR>')
-- Buffer vertical all
nmap('<Leader>bva', ':vert ba<CR>')
-- Buffer tab all
nmap('<Leader>bta', ':tab ba<CR>')
-- Delete buffer
nmap('<Leader>bd', ':bd<CR>')

-- Resize window
nmap('<RIGHT>', ':vertical resize +5<CR>')
nmap('<LEFT>', ':vertical resize -5<CR>')
nmap('<UP>', ':resize +5<CR>')
nmap('<DOWN>', ':resize -5<CR>')

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
nmap('<Leader>D', [["_ddd]])

nmap('<Leader><C-l>', ':noh<CR>')

-- Normalize search position
nmap('n', 'nzzzv')
nmap('N', 'Nzzzv')

-- Run shell from selected line
nmap('Q', '!!$SHELL<CR>') -- yield output of current line of $SHELL command
nmap('<Leader><space>', ':.!') -- yield output of current line through specified $SHELL command
vmap('<Leader><space>', ':!') -- yield output of selected lines through specified $SHELL command

nmap('<leader>QR', ':.!qrencode -m 2 -t utf8<CR>') -- qrcode from current line

-- SQL
nmap('<F5>', ':! mysql -u $SQL_USER -p $SQL_PASSWORD $SQL_DB -t 2>/dev/null<CR>')

-- Edit in VSCode
nmap('<Leader><Leader>ec', ':!code %<CR> | :redraw!<CR>')

-- Edit config
nmap('<leader>ev', ':vsplit $MYVIMRC<CR>')
nmap('<leader>sv', ':source $MYVIMRC<CR>')
nmap('<leader>et', ':vsplit ~/.config/tmux/tmux.conf<CR>')
nmap('<leader>ez', ':vsplit ~/.config/zsh/.zshrc<CR>')
