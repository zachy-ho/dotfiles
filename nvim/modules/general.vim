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
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set cursorline
set lazyredraw
set updatetime=50
let mapleader = " "

augroup remember_folds
    autocmd!
    let btToIgnore = ['terminal']
    autocmd BufWinLeave ?* if index(btToIgnore, &buftype) < 0 |mkview 1
    autocmd BufWinEnter ?* silent! loadview 1
augroup END
