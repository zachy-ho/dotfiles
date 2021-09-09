--> Color scheme settings <--

-- Gruvbox
vim.cmd([[
    colorscheme gruvbox
    set background=dark
]])

-- To have opaque bg with Kitty
vim.cmd([[
    hi! Normal ctermbg=NONE guibg=NONE
    hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
    hi! ColorColumn ctermbg=8
]])

-- [[
-- **Nord
-- colorscheme nord
-- **Material - Marko Cerovac
-- colorscheme material
-- let g:material_style = 'oceanic'
-- ]]
