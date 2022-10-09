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

-- Vim Windowswap
vim.cmd [[
	let g:windowswap_map_keys = 0 "prevent default bindings
	nnoremap <silent> <leader>W :call WindowSwap#EasyWindowSwap()<CR>
]]

-- Schlepp
vmap('<up>',    '<Plug>SchleppUp')
vmap('<down>',  '<Plug>SchleppDown')
vmap('<left>',  '<Plug>SchleppLeft')
vmap('<right>', '<Plug>SchleppRight')

-- Vim-test
nmap('<Leader>tn', ':TestNearest<CR>')
nmap('<Leader>tf', ':TestFile<CR>')
nmap('<Leader>ta', ':TestSuite<CR>')
nmap('<Leader>tl', ':TestLast<CR>')
nmap('<Leader>tv', ':TestVisit<CR>')

-- Trouble
nmap('<Leader>xx', ':Trouble<CR>')
nmap('<Leader>xw', ':Trouble workspace_diagnostics<CR>')
nmap('<Leader>xd', ':Trouble document_diagnostics<CR>')
nmap('<Leader>xq', ':Trouble quickfix<CR>')
nmap('<Leader>xl', ':Trouble loclist<CR>')

-- Telescope
nmap(';', ':Telescope buffers<CR>')
nmap('<Leader>fb', ':Telescope buffers<CR>')
nmap('<Leader>fc', ':Telescope commands<CR>')
nmap('<Leader>fd', ':Telescope diagnostics<CR>')
nmap('<Leader>ff', ':Telescope find_files<CR>')
nmap('<Leader>fg', ':Telescope live_grep<CR>')
nmap('<Leader>fh', ':Telescope help_tags<CR>')
nmap('<Leader>fl', ':Telescope current_buffer_fuzzy_find<CR>')
nmap('<Leader>fm', ':Telescope marks<CR>')
nmap('<Leader>fo', ':Telescope oldfiles<CR>')
nmap('<Leader>fq', ':Telescope quickfix<CR>')
nmap('<Leader>fr', ':Telescope registers<CR>')
nmap('<Leader>fs', ':Telescope session-lens search_session<CR>')
nmap('<Leader>gc', ':Telescope git_commits<CR>')
nmap('<Leader>gC', ':Telescope git_bcommits<CR>')
nmap('<Leader>gb', ':Telescope git_branches<CR>')
nmap('<Leader>gs', ':Telescope git_status<CR>')
nmap('<Leader>gS', ':Telescope git_stash<CR>')

-- Startify
nmap('<Leader><Leader>S', ':SSave<CR>')
nmap('<Leader><Leader>L', ':SLoad<CR>')
nmap('<Leader><Leader>D', ':SDelete<CR>')

-- Vim-autoformat
nmap('<F4>', ':Autoformat<CR>')

-- Vim-easy-align
nmap('ga', '<Plug>(EasyAlign)')
xmap('ga', '<Plug>(EasyAlign)')

nmap('<Leader>il', ':IndentLinesToggle<CR>')
nmap('<Leader>tb', ':TagbarToggle<CR>')
