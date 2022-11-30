return {
	{
		"folke/tokyonight.nvim",
		as = "tokyonight",
		config = function()
			require("tokyonight").setup({
				style = "storm",
				-- style = 'night',
				-- style = 'moon',
				-- style = 'day',
			})

			-- Set up config above before setting colorscheme
			vim.cmd([[colorscheme tokyonight-storm]])
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
