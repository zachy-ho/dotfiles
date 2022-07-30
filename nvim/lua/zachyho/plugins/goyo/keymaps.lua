local keymaps = {
	as_table = {
		toggle = "<leader>zm",
	},
}

local table_utils = safe_require("zachyho.table_utils")
if table_utils then
	keymaps.as_list = table_utils.get_values(keymaps.as_table)
end

return keymaps
