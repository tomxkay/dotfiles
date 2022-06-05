vim.cmd [[
syntax enable
colorscheme gruvbox

let base16colorspace=256
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

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

" Tmuxline
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '',
      \'c'    : ['CPU: #{cpu_fg_color} #{cpu_percentage} #[fg=colour250]', '#{sysstat_mem}', '#{sysstat_swap}'],
      \'win'  : '#I #W',
      \'cwin' : '#I #W #F',
      \'x'    : '#{prefix_highlight} #[fg=$color_light,bg=$color_window_off_indicator]#([ $(tmux show-option -qv key-table) = "off" ] && echo "OFF")#[default] #[fg=$color_dark,bg=$color_secondary]#{?window_zoomed_flag,[Z],}#[default] %a %h %d %R #{battery_status_fg} #{battery_icon} #{battery_percentage}',
      \'y'    : '',
      \'z'    : '#(whoami)@#H #{online_status}'
      \}
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:tmuxline_theme = 'airline_visual'
let g:tmuxline_powerline_separators = 1

]]

vim.opt.clipboard:append 'unnamedplus'
vim.opt.shortmess:append 'c'
vim.g.t_co = 256

local settings = {
  hidden = true,
  backspace = { 'indent', 'eol', 'start' },

  -- UI
  background = 'dark',
  textwidth = 80,
  colorcolumn = '80',
  showbreak = '↪',
  list = true,
  listchars = { tab = '»»', trail = '·', nbsp = '~', eol = '↲', precedes = '←', extends = '→' },
  virtualedit = 'block',
  belloff = 'all',
  visualbell = true, -- blink cursor on error, instead of beeping
  wildmenu = true, -- visual autocomplete for command menu
  showcmd = true,
  number = true,
  relativenumber = true,

  cursorline = true, -- highlight the current line
  modeline = true,
  ruler = true,
  laststatus = 2, -- always display the status line

  -- Indent
  expandtab = false,
  smarttab = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  shiftround = true,
  autoindent = true,
  startofline = false,
  smartindent = true,

  -- New split right/bottom
  splitright = true,
  splitbelow = true,

  -- Always use vertical diffs

  -- Scroll
  scrolloff = 8,
  sidescrolloff = 15,
  sidescroll = 1,
  ttyfast = true,

  -- Fold
  foldnestmax = 10,
  foldlevelstart = 20,

  -- Searching
  gdefault = true, -- Default /g at end of search
  ignorecase = true,
  smartcase = true,
  hlsearch = true,
  incsearch = true,
  lazyredraw = false,
  showmatch = true, -- show matching braces

  -- Encoding
  encoding = 'utf-8',
  fileencoding = 'utf-8',

  -- Misc
  backup = false,
  writebackup = false,
  swapfile = false,

  autowrite = true, -- automatically :write before running commands
  autoread = true, -- reload files changes outside vim

  mouse = 'a', -- enable use of mouse for all modes
  confirm = true, -- ask to save file rather than failing command

  updatetime = 300,
  signcolumn = 'yes',
  timeout = false,
  ttimeout = true,
  ttimeoutlen = 10, -- quickly timeout on keycodes, but never on mappings
  cmdheight = 1,
}

for k, v in pairs(settings) do
  vim.opt[k] = v
end
