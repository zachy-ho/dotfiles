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
	evergarden = {
		"comfysage/evergarden",
		config = function()
			require("evergarden").setup({
				transparent_background = false,
				contrast_dark = "medium", -- 'hard'|'medium'|'soft'
				override_terminal = true,
				style = {
					tabline = { reverse = true, color = "green" },
					search = { reverse = false, inc_reverse = true },
					types = { italic = true },
					keyword = { italic = true },
					comment = { italic = false },
					sign = { highlight = false },
				},
				overrides = {},
			})
			vim.cmd([[colorscheme evergarden]])
		end,
	},
}

return colorschemes["evergarden"]
