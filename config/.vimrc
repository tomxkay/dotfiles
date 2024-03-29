" (Neo)Vim Configuration
" Vimmer: Thomas Kay

" Persistence guarentees that results are inevitable.
"
" Copyright 2020 Thomas Kay

set nocompatible

" runtimepath
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" Vim Plugins
filetype off
call plug#begin('$XDG_CONFIG_HOME/vim/plugged')
" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " Enable Gbrowse from fugitive.vim to open GitHub URLs
Plug 'Xuyuanp/nerdtree-git-plugin'

" Language Syntax
Plug 'sheerun/vim-polyglot'
Plug 'Chiel92/vim-autoformat'
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" Util
Plug 'ojroques/vim-oscyank', { 'branch': 'main' }
Plug 'jiangmiao/auto-pairs'
Plug 'zirrostig/vim-schlepp'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'eshion/vim-sync'
Plug 'skywind3000/asyncrun.vim'
Plug 'mlaursen/vim-react-snippets'
Plug 'vim-test/vim-test'
Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }
Plug 'benmills/vimux'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'

" Syntax Theme Colors
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
call plug#end()
filetype plugin indent on

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" Vim auto commands
augroup Reload
  autocmd!
  autocmd bufwritepost $MYVIMRC source % | echom "Reloaded runtime config" . $MYVIMRC | redraw
  autocmd bufwritepost ~/Documents/dotfiles/config/.vimrc source % | echom "Reloaded ~/Documents/dotfiles/config/.vimrc" | redraw
  autocmd bufwritepost ~/.config/vim/vimrc source % | echom "Reloaded ~/.config/vim/vimrc" | redraw
augroup END

augroup Vimrc
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace on save
  autocmd FileType html,css EmmetInstall
  autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
augroup END

augroup SaveTrigger
  " au BufWrite * :Autoformat
augroup END

augroup PluginsAutocmd
  autocmd!
  autocmd CursorHold * silent call CocActionAsync('highlight') " Highlight on cursor hold
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  autocmd BufEnter NERD_tree_* | execute 'normal R'
augroup END

augroup PersistView
  autocmd!
  " autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
augroup END

augroup Numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained * set relativenumber
  autocmd BufLeave,FocusLost   * set norelativenumber
augroup END

augroup IdentifyTypeScriptFiles
  autocmd!
  autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
  autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
augroup END

augroup VimFold
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType javascript setlocal foldmethod=expr
  autocmd FileType javascript setlocal foldexpr=JSFolds()
  autocmd FileType typescript setlocal foldmethod=expr
  autocmd FileType typescript setlocal foldexpr=JSFolds()
  autocmd BufWinEnter * silent! :%foldopen!
augroup END

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" Vim options and variable assignments
syntax enable
colorscheme gruvbox

set hidden

if has('nvim')
  set clipboard+=unnamedplus
else
  set clipboard=unnamed
endif

set backspace=indent,eol,start

" User Interface
set t_Co=256
let base16colorspace=256
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark

set textwidth=80
set colorcolumn=80
set showbreak=↪\
set list
set listchars=tab:»»,trail:·,nbsp:~,eol:↲,precedes:←,extends:→
set virtualedit=block

set belloff=all
set visualbell " blink cursor on error, instead of beeping

set wildmenu " visual autocomplete for command menu
set showcmd
set number
set relativenumber

set cursorline " highlight the current line
set modeline
set ruler
set laststatus=2 " always display the status line"

" Indent
set noexpandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set autoindent
set nostartofline
set smartindent

" Open new split panes to right and bottom, which feels more natural
set splitright
set splitbelow
" Always use vertical diffs
if &diff
  set diffopt-=internal
  set diffopt+=vertical
endif

" Scroll
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
set ttyfast

set nobackup
set nowritebackup
set noswapfile

set autowrite " automatically :write before running commands
set autoread " reload files changes outside vim

set mouse=a " enable use of mouse for all modes"
set confirm " ask to save file rather than failing command"

set updatetime=300
set shortmess+=c
set signcolumn=yes
set notimeout ttimeout ttimeoutlen=10 " quickly timeout on keycodes, but never on mappings
" set cmdheight=2 " avoid press <Enter> to continue
set cmdheight=1

" Fold
set foldmethod=indent
set foldnestmax=10
set foldlevelstart=20
"
" Searching
set gdefault     " Default /g at end of search
set ignorecase
set smartcase
set hlsearch
set incsearch
set nolazyredraw
set showmatch    " show matching braces

" Encoding
set encoding=utf-8
set fileencoding=utf-8

set tags+=./tags,~/$XDG_CACHE_HOME/vim/ctags

" Persist undo over buffer switches and exits
:silent call system('mkdir -p ' . $XDG_DATA_HOME . '/vim/undo')
set undodir=$XDG_DATA_HOME/vim/undo
set undofile
set undolevels=1000
set undoreload=10000

" Persist views
:silent call system('mkdir -p ' . $XDG_DATA_HOME . '/vim/view')
set viewdir=$XDG_DATA_HOME/vim/view
set viewoptions-=options

" Backup
:silent call system('mkdir -p ' . $XDG_DATA_HOME . '/vim/backup')
set backupdir=$XDG_DATA_HOME/vim/backup

" Swap
:silent call system('mkdir -p ' . $XDG_DATA_HOME . '/vim/swap')
set directory=$XDG_DATA_HOME/vim/swap

" Plugin settings
" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

let g:Schlepp#reindent = 1

" vim-test
let test#strategy = 'vimux'
let test#ruby#rspec#options = '--format documentation'

" Coc
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-snippets', 'coc-solargraph']

if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    let g:python3_host_prog = '/opt/homebrew/bin/python3'
  else
    let g:python3_host_prog = '/usr/bin/python3'
    let g:python_host_prog = '/usr/bin/python'
  endif
else
  let g:python3_host_prog = '/usr/bin/python3'
  let g:python_host_prog = '/usr/bin/python'
endif

let g:NERDTreeQuitOnOpen=1
let g:NERDTreeWinPos="right"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

" Enable Emmet only for html/css
let g:user_emmet_install_global = 0

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" Vim mappings
map , <Leader>
map <space> <Leader>

" OSCYank
vnoremap <leader>c :OSCYank<CR>
nmap <leader>o <Plug>OSCYank

map <Leader>I :%s/\s\+$//e<CR>
" Map temp default -- runs ts-node on current file
" map ,l :!clear && ts-node %<CR>
" map ,r :!clear && python %<CR>
map ,r :!tmux send-keys -t 2 'clear' C-m 'python3 %' C-m<CR>

map <Leader>w :w<CR>

map <Leader>z <C-w>\| <C-w>_
map <Leader>Z <C-w>=

" Edit rc
map <Leader>ev <C-w>v<C-w>l:e! ~/.config/vim/vimrc<CR>
map <Leader>et <C-w>v<C-w>l:e! ~/.config/tmux/tmux.conf<CR>
map <Leader>ez <C-w>v<C-w>l:e! ~/.config/zsh/.zshrc<CR>

" Rename file
map <Leader>n :call RenameFile()<cr>

" Toggle relative numbering
map <F6> :set relativenumber!<bar>set relativenumber?<CR>

" Allow saving of files as sudo
cmap w!! %!sudo tee > /dev/null %

" Window Management
nmap ss :split<Return>
nmap sv :vsplit<Return>
nmap sx :q<CR>

" Move window
nmap sh <C-w>h
nmap sk <C-w>k
nmap sj <C-w>j
nmap sl <C-w>l
nmap so <C-w>o

nmap <C-h> <C-w>h
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j
nmap <C-l> <C-w>l

" Swap window
nmap sH <C-w>H
nmap sK <C-w>K
nmap sJ <C-w>J
nmap sL <C-w>L

nmap <C-w><C-H> <C-w>H
nmap <C-w><C-K> <C-w>K
nmap <C-w><C-J> <C-w>J
nmap <C-w><C-L> <C-w>L


" Opens all buffers as vertical splits
nmap <leader>vba :vert ba<CR>

" Opens all buffers as tabs
nmap <leader>tba :tab ba<CR>

" Closes all buffers but current buffer
nmap <leader>bo :%bd\|e#\|bd#\|'"<CR>

" Delete current buffer
nmap <leader>bd :bd<CR>

nnoremap <Leader>ov :exe ':silent !code %' <CR>:redraw!<CR>

nnoremap <Leader>d "_d

" Quickly close windows
nnoremap <Leader>x :x<CR>
nnoremap <Leader>X :q!<CR>

" Use enter to create new line w/o entering insert mode
nnoremap <CR> o<ESC>

nnoremap Y y$

nnoremap * *<C-o>

nnoremap D dd

" Moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk

" Resize panes
nnoremap <silent> <RIGHT> :vertical resize +5<CR>
nnoremap <silent> <LEFT> :vertical resize -5<CR>
nnoremap <silent> <UP> :resize +5<CR>
nnoremap <silent> <DOWN> :resize -5<CR>

inoremap kj <ESC>
inoremap jj <ESC>

" Keep search matches centered
nnoremap n nzzzv
nnoremap N Nzzzv

" Make vaa select the entire file...
xmap aa VGo1G

" Make BS/DEL work as expected in visual mode
xmap <BS> x

" Mode Group Mappings
" Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<CR>"
map <silent><Leader><S-p> :set paste<CR>o<esc>"*]p:set nopaste<CR>"

" Clear search hightliting with C-L
noremap <silent> <leader>cl :nohlsearch <bar> redraw!<CR>
inoremap <silent> <leader>cl <C-o>:nohlsearch <bar> redraw!<CR>

" Execute the current line/selection as a shell command
" :.!<command>
noremap Q !!$SHELL<CR>
vnoremap Q !$SHELL<CR>

" Plugin mappings
noremap <leader>/ :Commentary<CR>

map <Leader>; :call NerdTreeToggleFind()<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" Make arrow keys move visual blocks around
nmap ˚ V<Plug>SchleppUp
nmap ∆ V<Plug>SchleppDown
nmap ¬ V<Plug>SchleppRight
nmap ˙ V<Plug>SchleppLeft

vmap ˚ <Plug>SchleppUp
vmap ∆ <Plug>SchleppDown
vmap ¬ <Plug>SchleppRight
vmap ˙ <Plug>SchleppLeft

vmap <up>    <Plug>SchleppUp
vmap <down>  <Plug>SchleppDown
vmap <right> <Plug>SchleppRight
vmap <left>  <Plug>SchleppLeft

vmap <C-D> <Plug>SchleppDup
vmap  <Plug>SchleppDup k
vmap Ô <Plug>SchleppDup j
nmap  <Plug>SchleppDup k
nmap Ô <Plug>SchleppDup j

" vim-test
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

" Fzf
" File Finder
let g:fzf_preview_window = ''
let g:fzf_layout = { 'down': '~40%' }

nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
" Buffer Finder
nmap ; :Buffers<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
" Tag Finder
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>
" Line Finder
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>
" Project Finder
nmap <Leader>\ :Rg<Space>
" Help Finder
nmap <Leader>H :Helptags!<CR>

" Coc
nmap <Leader>E :CocCommand eslint.executeAutofix<CR>

" Use <C-l> to trigger snippet expansion
inoremap <silent><expr> <C-l>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> gh :call <SID>show_documentation()<CR>

nmap <leader>.  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

" Mappings using CoCList:
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<CR>
nnoremap <silent> <space>e  :<C-u>CocList extensions<CR>
nnoremap <silent> <space>c  :<C-u>CocList commands<CR>

" vim-autoformat
noremap <F4> :Autoformat<CR>

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

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" Functions
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! NerdTreeToggleFind()
  if exists("g:NERDTree") &&g:NERDTree.IsOpen()
    NERDTreeClose
  elseif filereadable(expand('%'))
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction

function! JSFolds()
  let thisline = getline(v:lnum)
  if thisline =~? '\v^\s*$'
    return '-1'
  endif

  if thisline =~ '^import.*$'
    return 1
  else
    return indent(v:lnum) / &shiftwidth
  endif
endfunction

" }}}
