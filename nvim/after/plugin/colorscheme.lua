-- > Color scheme settings <--

-- ----- Gruvbox -----
-- vim.cmd([[
-- colorscheme gruvbox
-- set background=dark
-- ]])

-- To have opaque bg with Kitty
-- vim.cmd([[
-- hi! Normal ctermbg=NONE guibg=NONE
-- hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
-- hi! ColorColumn ctermbg=8
-- ]])

-- ----- Nord -----
-- vim.cmd([[
-- colorscheme nord
-- ]])

-- ----- Material ------
-- vim.cmd([[
-- colorscheme material
-- let g:material_style = 'oceanic'
-- ]])

-- ----- Nightfox -----
local ok, nightfox = pcall(require, "nightfox")
if not ok then
	return
end

nightfox.setup({
	options = {
		styles = {
			comments = "italic", -- change style of comments to be italic
			keywords = "bold", -- change style of keywords to be bold
			functions = "italic,bold", -- styles can be a comma separated list
		},
	},
})

-- Choose nightfox variant here
vim.cmd("colorscheme duskfox")

-- ----- Rose pine -----
-- vim.g.rose_pine_variant = 'moon'
-- vim.cmd('colorscheme rose-pine')

-- vim.cmd([[
-- if has('termguicolors')
-- set termguicolors
-- endif

-- let g:sonokai_style = 'andromeda'
-- let g:sonokai_enable_italic = 1

-- colorscheme sonokai
-- ]])
