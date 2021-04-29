" ---------- Basic settings ----------
syntax on
" Cursor shapes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" Other sets
set foldmethod=manual
set noshowmode
set relativenumber
set nu
set scrolloff=12
set noerrorbells
set textwidth=0
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set nowrap
set smartcase
set ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set nohlsearch
set cursorline
set colorcolumn=80
set lazyredraw
set updatetime=50
let mapleader = " "
runtime macros/matchit.vim
