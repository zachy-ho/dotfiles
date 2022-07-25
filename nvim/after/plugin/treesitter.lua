local rainbow_colors = {
	rose_pine = {
		-- Red
		"#eb6f92",
		-- Green
		"#31748f",
		-- Yellow
		"#f6c177",
		-- Blue
		"#9ccfd8",
		-- Magenta
		"#c4a7e7",
		-- Cyan
		"#ebbcba",
		-- White
		"#e0def4",
	},
	rose_pine_moon = {
		-- Red
		"#eb6f92",
		-- Green
		"#3e8fb0",
		-- Yellow
		"#f6c177",
		-- Blue
		"#9ccfd8",
		-- Magenta
		"#c4a7e7",
		-- Cyan
		"#ea9a97",
		-- White
		"#e0def4",
	},
}

require("nvim-treesitter.configs").setup({
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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
	-- Module: Rainbow
	rainbow = {
		enable = true,
		extended_mode = false,
		max_file_lines = nil,
		colors = rainbow_colors.rose_pine,
	},
})
