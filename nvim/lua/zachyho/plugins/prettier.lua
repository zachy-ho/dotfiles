return {
	"prettier/vim-prettier",
	config = function()
		map("n", "<leader>pr", ":Prettier<CR>")
	end,
}
