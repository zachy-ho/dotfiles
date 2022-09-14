return {
	"michal-h21/vim-zettel",
	requires = "vimwiki/vimwiki",
	config = function()
		vim.cmd([[source ~/.config/nvim/lua/zachyho/plugins/vim_zettel/config.vim]])

		map("n", "<leader>zn", ":ZettelNew<CR>")
		map("n", "<leader>zy", ":ZettelYankName<CR>")
	end,
}
