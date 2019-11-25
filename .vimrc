""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

" fzf
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf

call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" TypeScript
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/tsuquyomi'

" JavaScript
Plug 'pangloss/vim-javascript'

" React"
Plug 'maxmellon/vim-jsx-pretty'

" Util
Plug 'w0rp/ale'
Plug 'ycm-core/YouCompleteMe'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
" Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'joshukraine/dragvisuals'
Plug 'terryma/vim-expand-region'
Plug 'metakirby5/codi.vim', { 'on': 'Codi' }

" Code Formatter
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Search
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'

" Syntax Theme Colors
Plug 'dracula/vim'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'

" Nvim
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

call plug#end()

" YouCompleteMe
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
filetype plugin indent on

" Remove trailing whitespaces on save (:w)
autocmd BufWritePre * :%s/\s\+$//e
" Auto source .vimrc
autocmd! bufwritepost .vimrc source %


" pre settings for tmux color correction with set termguicolors
" This is only necessary if you use set termguicolors.
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


" Settings
set tags+=./tags;$HOME
set nobackup
set nowritebackup
set noswapfile
set autowrite " automatically :write before running commands
set autoread " reload files changes outside vim
set hidden " jumping from unsaved files causes files to be hidden instead of closed
set mouse=a " enable use of mouse for all modes"
set belloff=all
set visualbell " blink cursor on error, instead of beeping
set wildmenu " visual autocomplete for command menu
set showcmd
set cursorline " highlight the current line
set modeline
set ruler
set laststatus=2 " always display the status line"
set number
set relativenumber
set noexpandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set autoindent
set nostartofline
set smartindent
set backspace=indent,eol,start
set clipboard=unnamed
" quickly timeout on keycodes, but never on mappings"
set notimeout ttimeout ttimeoutlen=200
set cmdheight=2 " avoid press <Enter> to continue"
set confirm " ask to save file rather than failing command"

" Faster redrawing
set ttyfast

" Code folding settings
set foldmethod=syntax "fold based on indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Square up visual selections
set virtualedit=block

" Persist undo over buffer switches and exits
:silent call system('mkdir -p ' . $HOME . '/.vim/undo')
set undofile
set undodir=$HOM#/.vim/undo
set undolevels=1000
set undoreload=10000

" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

""""""""""""""""""""""""""""""""""""""""""
" => User Interface
""""""""""""""""""""""""""""""""""""""""""
syntax enable
set t_Co=256
let base16colorspace=256
set background=dark
set termguicolors

" Set encoding
set encoding=utf-8
set fileencoding=utf-8

" Color
colorscheme gruvbox

" Searching
set gdefault     " Default /g at end of search
set ignorecase
set smartcase
set hlsearch
set incsearch
set nolazyredraw
set showmatch    " show matching braces

" Make it obvious where 100 characters is
set textwidth=80

" Open new split panes to right and bottom, which feels more natural
set splitright
set splitbelow

" Always use vertical diffs
set diffopt+=vertical

" Scrolling
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

""""""""""""""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""""""""""""""
map , <Leader>
map <Space> <Leader>

" Easier/quicker save
nnoremap <Leader>w :Prettier<CR>:w<CR>

" Map temp default -- runs ts-node on current file
map ,l :!clear && ts-node %<CR>

" Normal mode
nnoremap Y y$

" Insert mode
inoremap kj <ESC>
inoremap jj <ESC>

" Execute shell command from text
noremap Q !!$SHELL<CR>
vnoremap Q !$SHELL<CR>

" Quickly close windows
nnoremap <Leader>x :x<CR>
nnoremap <Leader>X :q!<CR>

" Use enter to create new line w/o entering insert mode
nnoremap <CR> o<ESC>

" Rename file
map <Leader>n :call RenameFile()<cr>

" Allow saving of files as sudo
cmap w!! %!sudo tee > /dev/null %

" Clear search hightliting with C-L
noremap <silent> <C-l> :nohlsearch <bar> redraw!<CR>
inoremap <silent> <C-l> <C-o>:nohlsearch <bar> redraw!<CR>

" Resize panes
nnoremap <silent> <RIGHT> :vertical resize +5<CR>
nnoremap <silent> <LEFT> :vertical resize -5<CR>
nnoremap <silent> <UP> :resize +5<CR>
nnoremap <silent> <DOWN> :resize -5<CR>

" Window Management
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
nmap sx :q<CR>

" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
map so <C-w>o

" Moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk

" Edit vimrc
map <Leader>ev :e! ~/.vimrc<CR> " edit ~/.vimrc"
" Toggle relative numbering
map <F6> :set relativenumber!<bar>set relativenumber?<CR>

" Buffer List
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Remap
nnoremap * *<C-o>
nnoremap <Leader>d "_d

" SYSTEM CLIPBOARD COPY & PASTE SUPPORT
set pastetoggle=<F2> "F2 before pasting to preserve indentation
" Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>o<esc>"*]p:set nopaste<cr>"

" Make vaa select the entire file...
xmap aa VGo1G

" Make BS/DEL work as expected in visual mode
xmap <BS> x

" Deoplete Select Navigation
if has('nvim')
	inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
	inoremap <expr> <C-k> pumvisible() ? "\<C-n>" : "\<C-k>"
endif

" window movement shortcuts
map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

""""""""""""""""""""""""""""""""""""""""""
" => Functions
""""""""""""""""""""""""""""""""""""""""""
" move to the window in the direction shown, or create a new window
function! WinMove(key)
	let t:curwin = winnr()
	exec """wincmd """.a:key
	if (t:curwin == winnr())
		if (match(a:key,'[jk]'))
			wincmd v
		else
			wincmd s
		endif
		exec "wincmd ".a:key
	endif
endfunction

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

" WordProcessorMode
function! WordProcessorMode()
	setlocal formatoptions=1
	setlocal noexpandtab
	map j gj
	map k gk
	setlocal spell spelllang=en_us
	set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
	set complete+=s
	set formatprg=par
	setlocal wrap
	setlocal linebreak
endfunction

"""""""""""""""""""""""""""""""
" => Commands
"""""""""""""""""""""""""""""""
com! WP call WordProcessorMode()

""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
""""""""""""""""""""""""""""""""""""""""""
map <Leader>k :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
" Close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Enable Emmet only for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Make arrow keys move visual blocks around
xmap <up>    <Plug>SchleppUp
xmap <down>  <Plug>SchleppDown
xmap <left>  <Plug>SchleppLeft
xmap <right> <Plug>SchleppRight

xmap D       <Plug>SchleppDupLeft
xmap <C-D>   <Plug>SchleppDupLeft

" Key mappings for dragvisuals.vim
runtime bundle/dragvisuals/plugins/dragvisuals.vim
vmap <expr> <LEFT>  DVB_Drag('left')
vmap <expr> <RIGHT> DVB_Drag('right')
vmap <expr> <DOWN>  DVB_Drag('down')
vmap <expr> <UP>    DVB_Drag('up')
vmap <expr> D       DVB_Duplicate()

vmap <expr> <Esc>h  DVB_Drag('left')
vmap <expr> <Esc>l  DVB_Drag('right')
vmap <expr> <Esc>j  DVB_Drag('down')
vmap <expr> <Esc>k  DVB_Drag('up')

" Fzf
" File Finder
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
" Buffer Finder
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
" nmap <Leader>/ :Ag<Space>
nmap <Leader>\ :Rg<Space>
" Help Finder
nmap <Leader>H :Helptags!<CR>
" Commentary key map
noremap <leader>/ :Commentary<cr>
