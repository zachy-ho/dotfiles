" ---------- Color scheme ----------
" Gruvbox
colorscheme gruvbox
set background=dark
" Nord
" colorscheme nord
" Material
" Choices - default, palenight, ocean, lighter, darker,
" default-community, palenight-community, ocean-community, lighter-community,
" darker-community
" let g:material_terminal_italics = 1
" let g:material_theme_style = 'darker'
" colorscheme material
" if (has('termguicolors'))
    " set termguicolors
" endif
" Have opaque bg with Alacritty
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
hi! ColorColumn ctermbg=8
