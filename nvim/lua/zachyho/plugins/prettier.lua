return {
	"prettier/vim-prettier",
	config = function()
		-- I don't want <leader>p to trigger this shit
		unmap("n", "<leader>p")
		-- Keep this and `keys` in sync
		local keymaps_upvalue = {
			prettier_sync = "<leader>prs",
		}

		map("n", keymaps_upvalue.prettier_sync, ":Prettier<CR>")
	end,
	-- Keep this and `keymaps_upvalue` in sync
	keys = "<leader>prs",
}
