"--------- Plugins ----------
call plug#begin('~/.vim/plugged')
"Colors
    Plug 'morhetz/gruvbox'
    Plug 'arcticicestudio/nord-vim'
" Cool things
    Plug 'ryanoasis/vim-devicons'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
"Tools
    Plug 'jremmen/vim-ripgrep'
    Plug 'mbbill/undotree'
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
"Syntax
    Plug 'dense-analysis/ale'
    "Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'preservim/nerdcommenter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Vim-be-good
    Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
"Efficiency
    "Plug 'vim-python/python-syntax'

call plug#end()
