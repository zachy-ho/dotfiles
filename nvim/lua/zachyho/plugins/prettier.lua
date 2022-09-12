return {
	"prettier/vim-prettier",
	config = function()
		-- Keep this and `keys` in sync
		local keymaps_upvalue = {
			prettier_sync = "<leader>fm",
		}

		map("n", keymaps_upvalue.prettier_sync, ":Prettier<CR>")
	end,
	-- Keep this and `keymaps_upvalue` in sync
	keys = "<leader>fm",
}
