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
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'jiangmiao/auto-pairs'
    Plug 'preservim/nerdcommenter'
"Vim-be-good
    Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

call plug#end()
