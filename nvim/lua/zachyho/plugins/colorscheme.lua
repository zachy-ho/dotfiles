return {
	-- "morhetz/gruvbox",
	-- "arcticicestudio/nord-vim",
	-- "EdenEast/nightfox.nvim",
	-- "sainnhe/sonokai",
	-- {
	-- "rose-pine/neovim",
	-- as = "rose-pine",
	-- },
	"monsonjeremy/onedark.nvim",
	config = function()
		-- ----- One Dark -----
		-- Setup
		local onedark = safe_require("onedark")
		if onedark then
			onedark.setup()
		end
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
		-- local nightfox = safe_require("nightfox")
		-- if nightfox then
		-- nightfox.setup({
		-- options = {
		-- styles = {
		-- comments = "italic", -- change style of comments to be italic
		-- keywords = "bold", -- change style of keywords to be bold
		-- functions = "italic,bold", -- styles can be a comma separated list
		-- },
		-- },
		-- })
		-- end

		-- Set
		-- nightfox, dayfox, dawnfox, duskfox, nordfox, terafox
		-- vim.cmd("colorscheme duskfox")

		-- ----- Rose pine -----
		-- Setup
		-- vim.cmd([[
		-- let g:sonokai_style = 'andromeda'
		-- let g:sonokai_enable_italic = 1
		-- ]])
		-- vim.g.rose_pine_variant = "moon"
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
	end,
}
