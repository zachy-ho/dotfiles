return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitter = {
			ensure_installed = {
				"bash",
				"css",
				"dockerfile",
				"gitignore",
				"graphql",
				"html",
				"http",
				"java",
				"javascript",
				"jsdoc",
				"json",
				"json5",
				"lua",
				"markdown",
				"nix",
				"prisma",
				"proto",
				"python",
				"regex",
				"scss",
				"sql",
				"tsx",
				"typescript",
				"vim",
				"vue",
				"yaml",
			}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
			highlight = {
				enable = true, -- false will disable the whole extension
				custom_captures = {},

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages

				additional_vim_regex_highlighting = true,
			},
			indent = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					node_decremental = "grp",
					scope_incremental = "grc",
				},
			},
			-- Module: Playground
			playground = {
				enable = true,
				disable = {},
				updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
				persist_queries = false, -- Whether the query persists across vim sessions
				keybindings = {
					toggle_query_editor = "o",
					toggle_hl_groups = "i",
					toggle_injected_languages = "t",
					toggle_anonymous_nodes = "a",
					toggle_language_display = "I",
					focus_language = "f",
					unfocus_language = "F",
					update = "R",
					goto_node = "<cr>",
					show_help = "?",
				},
			},
		}

		require("nvim-treesitter.configs").setup(treesitter)
	end,
}
