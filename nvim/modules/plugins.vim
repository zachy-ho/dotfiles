"--------- Plugins ----------
call plug#begin('~/.vim/plugged')
"Colors
    Plug 'morhetz/gruvbox'
    Plug 'arcticicestudio/nord-vim'
    Plug 'EdenEast/nightfox.nvim'
    Plug 'marko-cerovac/material.nvim'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Cool things
    Plug 'ryanoasis/vim-devicons'
    Plug 'mhinz/vim-startify'
"Tools
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'mbbill/undotree'
    Plug 'preservim/nerdtree'
    "To replace with telescope after learning Lua
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
"Syntax
    Plug 'dense-analysis/ale'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'mattn/emmet-vim'
    Plug 'leafgarland/typescript-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'preservim/nerdcommenter'
    Plug 'Canva/dprint-vim-plugin'

call plug#end()
