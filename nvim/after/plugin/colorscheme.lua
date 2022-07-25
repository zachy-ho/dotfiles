--> Color scheme settings <--

-- ----- Gruvbox -----
-- Setup
-- Set
-- vim.cmd([[
-- colorscheme gruvbox
-- hi! Normal ctermbg=NONE guibg=NONE
-- hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
-- hi! ColorColumn ctermbg=8
-- ]])

-- ----- Nord -----
-- Setup
-- Set
-- vim.cmd([[
-- colorscheme nord
-- ]])

-- ----- Nightfox -----
-- Setup
local nightfox_ok, nightfox = pcall(require, "nightfox")
if nightfox_ok then
	nightfox.setup({
		options = {
			styles = {
				comments = "italic", -- change style of comments to be italic
				keywords = "bold", -- change style of keywords to be bold
				functions = "italic,bold", -- styles can be a comma separated list
			},
		},
	})
else
	print("nightfox not installed")
end

-- Set
-- nightfox, dayfox, dawnfox, duskfox, nordfox, terafox
-- vim.cmd("colorscheme duskfox")

-- ----- Rose pine -----
-- Setup
vim.cmd([[
    let g:sonokai_style = 'andromeda'
    let g:sonokai_enable_italic = 1
]])
vim.g.rose_pine_variant = "moon"
-- Set
-- vim.cmd("colorscheme rose-pine")

-- ----- Sonokai -----
-- Set
-- vim.cmd([[
-- if has('termguicolors')
-- set termguicolors
-- endif
-- colorscheme sonokai
-- ]])

-- ----- Gruvbox -----
-- Setup
local onedark_ok, onedark = pcall(require, "onedark")
if onedark_ok then
	onedark.setup()
else
	print("onedark not installed")
end
-- Set
