local shortcuts = {
	as_table = {
		toggle = "<leader>nt",
		find_current_file = "<leader>nb",
		focus = "<leader>nf",
	},
	as_list = {},
}

for _k, v in pairs(shortcuts.as_table) do
	table.insert(shortcuts.as_list, v)
end

return shortcuts
