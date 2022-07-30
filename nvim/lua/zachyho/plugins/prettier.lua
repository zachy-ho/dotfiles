local keymaps = {
	prettier_sync = "<leader>prs",
}

local prettier = {
	"prettier/vim-prettier",
	config = function()
		-- I don't want <leader>p to trigger this shit
		unmap("n", "<leader>p")

		map("n", keymaps.prettier_sync, ":Prettier<CR>")
	end,
}
local table_utils = safe_require("zachyho.table_utils")
if table_utils then
	prettier.keys = table_utils.get_values(keymaps)
end
return prettier
