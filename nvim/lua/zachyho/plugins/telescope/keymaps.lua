local keymaps = {
	as_table = {
		telescope = "<leader>te",
		find_files = "<leader>of",
		live_grep = "<leader>og",
		buffers = "<leader>ob",
		command_history = "<leader>oc",
		keymaps = "<leader>okm",
	},
}

keymaps.as_list = table_utils.get_values(keymaps.as_table)
return keymaps
