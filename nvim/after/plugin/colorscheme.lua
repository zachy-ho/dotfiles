-- > Color scheme settings <--

-- Gruvbox
-- vim.cmd([[
    -- colorscheme gruvbox
    -- set background=dark
-- )

-- To have opaque bg with Kitty
-- vim.cmd([[
    -- hi! Normal ctermbg=NONE guibg=NONE
    -- hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
    -- hi! ColorColumn ctermbg=8
-- )

-- [[
-- **Nord
-- colorscheme nord
-- **Material - Marko Cerovac
-- colorscheme material
-- let g:material_style = 'oceanic'
-- ]]

local nightfox = require('nightfox')

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
nightfox.setup({
  fox = "nightfox", -- change the colorscheme to use nordfox
  styles = {
    comments = "italic", -- change style of comments to be italic
    keywords = "bold", -- change style of keywords to be bold
    functions = "italic,bold" -- styles can be a comma separated list
  },
})

-- Load the configuration set above and apply the colorscheme
nightfox.load()
