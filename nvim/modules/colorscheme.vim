" ---------- Color scheme ----------
" --- Gruvbox
" colorscheme gruvbox
" --- Nord
" colorscheme nord
" --- Material - Marko Cerovac
" colorscheme material
" let g:material_style = 'oceanic'
" --- Nightfox
" colorscheme nightfox

lua << EOF
    local nightfox = require('nightfox')
    nightfox.setup({
      fox = "nightfox",
      transparent = true,
      terminal_colors = true,
      styles = {
          comments = "italic",
          functions = "NONE",
          keywords = "bold",
          strings = "NONE",
          variables = "NONE",
          },
      inverse = {
          match_paren = false,
          visual = false,
          search = false,
          },
      colors = {},
      hlgroups = {},
    })
    nightfox.load()
EOF


" Have opaque bg with Kitty
" hi! Normal ctermbg=NONE guibg=NONE
" hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
" hi! ColorColumn ctermbg=8
