return {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	config = function()
		local treesitter = {
			-- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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

		local rainbow_colors = safe_require(constants.PLUGINS_DIR .. "nvim_treesitter.nvim_ts_rainbow")
		if rainbow_colors then
			treesitter.rainbow = {
				enable = true,
				extended_mode = false,
				max_file_lines = nil,
				colors = preconditions.check_exists(rainbow_colors.colors).onedark,
			}
		end
		require("nvim-treesitter.configs").setup(treesitter)
	end,
	event = "BufReadPre",
}
