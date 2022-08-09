local keymaps = {
	as_table = {
		toggle = "<leader>hp",
		toggle_telescope = "<leader>ht",
		add_file = "<leader>hm",
	},
}

keymaps.as_list = table_utils.get_values(keymaps.as_table)
return keymaps
