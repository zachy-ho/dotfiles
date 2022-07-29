-- Automatically sources this file and runs 'PackerSync' whenever we write to this file
-- vim.cmd([[
-- augroup Packer
-- autocmd!
-- autocmd BufWritePost ~/.config/dotfiles/nvim/lua/zachyho/plugins.lua source <afile> | PackerSync
-- augroup end
-- ]])

-- Please write this file and run ':PackerSync' after to sync shit up every time a change is made
return require("packer").startup({
	function(use)
		-- Packer manages itself
		use("wbthomason/packer.nvim")

		-- Vimwiki
		use({
			"vimwiki/vimwiki",
			branch = "dev",
			setup = function()
				-- Execute config file before loading the plugin so it knows where the wiki
				-- directories are upon loading
				require("zachyho.plugin_configs.vimwiki")
			end,
			keys = { "<leader>ww", "<leader>w<leader>w" },
		})

		-- Color schemes
		use({
			-- "morhetz/gruvbox",
			-- "arcticicestudio/nord-vim",
			-- "EdenEast/nightfox.nvim",
			-- "sainnhe/sonokai",
			"monsonjeremy/onedark.nvim",
			-- {
			-- "rose-pine/neovim",
			-- as = "rose-pine",
			-- },
		})

		-- Lualine
		use({
			"nvim-lualine/lualine.nvim",
			requires = {
				"kyazdani42/nvim-web-devicons",
				opt = true,
			},
			config = function()
				require("zachyho.plugin_configs.lualine")
			end,
			event = "BufWinEnter",
		})

		-- Goyo for Zen mode
		use({
			"junegunn/goyo.vim",
			config = function()
				require("zachyho.plugin_configs.goyo")
			end,
			keys = "<leader>zm",
		})

		-- Hexokinase: Previews color whenever color (e.g. hex) is used
		local hexokinase = require("zachyho.plugin_configs.hexokinase")
		use({
			"RRethy/vim-hexokinase",
			run = "make hexokinase",
			ft = hexokinase.filetypes,
		})

		-- Indent guides
		use({
			"glepnir/indent-guides.nvim",
			config = function()
				require("zachyho.plugin_configs.indent_guides")
			end,
			event = "BufWinEnter",
		})

		-- Nvim-tree: Tree-style navigator
		local nvim_tree_shortcuts = require("zachyho.plugin_configs.nvim_tree_shortcuts").as_list
		use({
			"kyazdani42/nvim-tree.lua",
			tag = "nightly", -- optional, updated every week. (see issue #1193)
			requires = {
				"kyazdani42/nvim-web-devicons",
			},
			config = function()
				require("nvim-tree").setup()
				require("zachyho.plugin_configs.nvim_tree")
			end,
			keys = nvim_tree_shortcuts,
		})

		-- Nerdtree-syntax-highlight: To identify filetypes in Nerdtree
		-- use({
		-- "tiagofumo/vim-nerdtree-syntax-highlight",
		-- after = "nerdtree",
		-- })

		-- TODO continue lazy loading here
		-- Lspkind: Cute logos for LSP
		use("onsails/lspkind-nvim")

		-- Telescope
		use({
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/plenary.nvim" } },
		})

		-- telescope-fzf-native for better sorting performance
		use({
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make",
		})
		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})

		-- Treesitter rainbow brackets
		use("p00f/nvim-ts-rainbow")

		-- Plenary
		use("nvim-lua/plenary.nvim")

		-- Native-lsp: Neovim native Language Server Protocols
		-- Nvim-lsp-installer
		use({
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		})

		-- Null-ls
		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = { "nvim-lua/plenary.nvim" },
		})
		-- Typescript LSP add-on
		use({
			"jose-elias-alvarez/typescript.nvim",
		})

		-- Vim devicons: Gives me pretty icons in Nerdtree
		use("ryanoasis/vim-devicons")

		-- Cmp: Completion engine
		use({
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
		})

		-- Undotree: Undo and redo
		use("mbbill/undotree")

		-- FZF: Fuzzy finder
		use({
			"/usr/local/opt/fzf",
			"junegunn/fzf",
			"junegunn/fzf.vim",
		})

		-- Grepper: Makes grepping shit and putting them in quickfix lists so easy
		use("mhinz/vim-grepper")

		-- Fugitive: Git operations within vim
		-- Rhubarb: To make GBrowse from Fugitive work
		use({
			"tpope/vim-fugitive",
			requires = {
				"tpope/vim-rhubarb",
			},
		})

		-- Emmet: HTML templating
		use({
			"mattn/emmet-vim",
			setup = function()
				vim.g.user_emmet_install_global = 0
				vim.g.user_emmet_leader_key = "<C-s>"
				vim.cmd([[
                autocmd FileType html,css,typescriptreact,javascriptreact,typescript,javascript EmmetInstall
                ]])
			end,
		})

		-- Autopairs: For pairs like '', "", (), {}, []
		use("windwp/nvim-autopairs")

		-- Surround: Whenever I want to surround something with pairs
		use("tpope/vim-surround")

		-- Easy align: Aligning things to look pretty
		use("junegunn/vim-easy-align")

		-- Nerdcommenter: Commenting shortcuts
		use("preservim/nerdcommenter")

		-- Harpoon: File marking to jump back and forth more quickly
		use("ThePrimeagen/harpoon")

		-- Headlines highlighting
		use("lukas-reineke/headlines.nvim")

		-- Markdown-preview: self-explanatory
		use({
			"iamcco/markdown-preview.nvim",
			run = "cd app && yarn install",
		})

		-- Prettier
		use("prettier/vim-prettier")

		----- Plugin graveyard -----
		-- Bufferline
		-- use({
		-- "akinsho/bufferline.nvim",
		-- requires = "kyazdani42/nvim-web-devicons",
		-- })

		-- Vsnip and snippets: Snippets for fast coding
		-- use({
		-- "hrsh7th/cmp-vsnip",
		-- "hrsh7th/vim-vsnip",
		-- "hrsh7th/vim-vsnip-integ",
		-- "rafamadriz/friendly-snippets",
		-- })

		-- Limelight
		-- use({ "junegunn/limelight.vim", })

		-- Lsp-Signature
		-- use({
		-- "ray-x/lsp_signature.nvim",
		-- })

		-- Treesitter-playground
		-- use({
		-- "nvim-treesitter/playground",
		-- requires = "nvim-treesitter/nvim-treesitter",
		-- })
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
