local keymaps = {
	as_table = {
		toggle = "<leader>nt",
		find_current_file = "<leader>nb",
		focus = "<leader>nf",
	},
}

keymaps.as_list = table_utils.get_values(keymaps.as_table)
return keymaps
