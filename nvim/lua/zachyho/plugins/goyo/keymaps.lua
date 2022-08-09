local keymaps = {
	as_table = {
		toggle = "<leader>zm",
	},
}

keymaps.as_list = table_utils.get_values(keymaps.as_table)

return keymaps
