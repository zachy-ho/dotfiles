return {
	{
		"folke/tokyonight.nvim",
		as = "tokyonight",
		config = function()
			-- require("tokyonight").setup({
			-- -- style = "storm",
			-- -- style = 'night',
			-- style = "moon",
			-- light_style = "day",
			-- })

			-- -- Set up config above before setting colorscheme
			-- vim.cmd([[colorscheme tokyonight-moon]])
			-- constants.COLORSCHEME = 'tokyonight'
		end,
	},
	{
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			-- ----- Rose pine -----
			-- vim.g.rose_pine_variant = "moon"
			-- Set
			-- vim.cmd("colorscheme rose-pine")
			-- constants.COLORSCHEME = "rose-pine"
		end,
	},
	{
		"sainnhe/gruvbox-material",
		as = "gruvbox-material",
		config = function()
			vim.cmd([[
                if has('termguicolors')
                    set termguicolors
                endif

                set background=dark

                let g:gruvbox_material_background='soft'
                let g:gruvbox_material_better_performance=1
                let g:gruvbox_material_enable_italic=1

                colorscheme gruvbox-material

            ]])
			constants.COLORSCHEME = "gruvbox-material"
		end,
	},
	-- {
	-- "monsonjeremy/onedark.nvim",
	-- branch = "treesitter",
	-- config = function()
	-- local onedark = safe_require("onedark")
	-- if onedark then
	-- onedark.setup()
	-- end
	-- end,
	-- },
}
