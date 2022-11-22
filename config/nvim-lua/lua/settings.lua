vim.cmd [[
syntax enable
colorscheme gruvbox

" Persist undo over buffer switches and exits
:silent call system('mkdir -p ' . $XDG_DATA_HOME . '/nvim/undo')
set undodir=$XDG_DATA_HOME/nvim/undo
set undofile
set undolevels=1000
set undoreload=10000

" Persist views
:silent call system('mkdir -p ' . $XDG_DATA_HOME . '/nvim/view')
set viewdir=$XDG_DATA_HOME/nvim/view
set viewoptions-=options

" Backup
:silent call system('mkdir -p ' . $XDG_DATA_HOME . '/nvim/backup')
set backupdir=$XDG_DATA_HOME/nvim/backup

" Swap
:silent call system('mkdir -p ' . $XDG_DATA_HOME . '/nvim/swap')
set directory=$XDG_DATA_HOME/nvim/swap


if has('nvim') && executable('nvr')
  let $GIT_EDITOR = "nvr -cc tabnew --remote-wait +'set bufhidden=wipe'"
endif
]]

vim.opt.clipboard:append 'unnamedplus'
vim.opt.shortmess:append 'c'

-- Tmux color settings
vim.g.t_co = 256
vim.g.t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"
vim.g.t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"
vim.g.base16colorspace = 256

local settings = {
  -- UI
  termguicolors    = true,
  background       = 'dark',
  textwidth        = 80,
  colorcolumn      = '80',
  showbreak        = '↪',
  list             = true,
  listchars        = { tab = '»»', trail = '·', nbsp = '~', eol = '↲', precedes = '←', extends = '→' },
  virtualedit      = 'block',
  belloff          = 'all',
  visualbell       = true, -- blink cursor on error, instead of beeping
  wildmenu         = true, -- visual autocomplete for command menu
  showcmd          = true,
  number           = true,
  wrap             = false,
  -- relativenumber   = true,

  cursorline     = true, -- highlight the current line
  modeline       = true,
  ruler          = true,
  laststatus     = 2, -- always display the status line
  cmdheight      = 1,

  -- Indent
  expandtab      = true,
  smarttab       = true,
  tabstop        = 2,
  softtabstop    = 2,
  shiftwidth     = 2,
  shiftround     = true,
  autoindent     = true,
  startofline    = false,
  smartindent    = true,

  -- Intuitive split
  splitright     = true,
  splitbelow     = true,

  -- Scroll/Mouse
  mouse          = 'a', -- enable use of mouse for all modes
  scrolloff      = 8,
  sidescrolloff  = 15,
  sidescroll     = 1,
  ttyfast        = true,

  -- Fold
  foldnestmax    = 10,
  foldlevelstart = 20,

  -- Searching
  gdefault       = true, -- Default /g at end of search
  ignorecase     = true,
  smartcase      = true,
  hlsearch       = true,
  incsearch      = true,
  showmatch      = true, -- show matching braces

  -- Encoding
  encoding       = 'utf-8',
  fileencoding   = 'utf-8',

  -- Misc
  backup         = false,
  writebackup    = false,
  swapfile       = false,

  autowrite      = true, -- automatically :write before running commands
  autoread       = true, -- reload files changes outside vim

  confirm        = true, -- ask to save file rather than failing command
  backspace      = { 'indent', 'eol', 'start' },

  hidden         = true,
  lazyredraw     = false,
  updatetime     = 300,
  signcolumn     = 'yes',
  timeout        = false,
  ttimeout       = true,
  ttimeoutlen    = 10, -- quickly timeout on keycodes, but never on mappings
}

for k, v in pairs(settings) do
  vim.opt[k] = v
end
