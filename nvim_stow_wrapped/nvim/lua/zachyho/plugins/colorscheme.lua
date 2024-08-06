local colorschemes = {
	gruvbox_material = {
		"sainnhe/gruvbox-material",
		name = "gruvbox-material",
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
		end,
	},
	kanagawa = {
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").load("wave")
		end,
	},
	tokyonight = {
		"folke/tokyonight.nvim",
		as = "tokyonight",
		config = function()
			require("tokyonight").setup({
				-- style = "storm",
				-- style = 'night',
				style = "moon",
			})
			-- Set up config above before setting colorscheme
			vim.cmd([[colorscheme tokyonight-moon]])
		end,
	},
	rose_pine = {
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			-- ----- Rose pine -----
			vim.g.rose_pine_variant = "moon"
			-- Set
			vim.cmd("colorscheme rose-pine")
		end,
	},
	onedark = {
		"monsonjeremy/onedark.nvim",
		branch = "treesitter",
		config = function()
			require("onedark").setup()
			vim.cmd([[colorscheme onedark]])
		end,
	},
	catppuccin = {
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato",
			})
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
	everforest = {
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.everforest_enable_italic = true
			vim.g.everforest_better_performance = 1
			vim.g.everforest_background = "medium"
			vim.cmd.colorscheme("everforest")
		end,
	},
}

return colorschemes["everforest"]
