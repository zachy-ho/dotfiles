return {
	"michal-h21/vim-zettel",
	requires = "vimwiki/vimwiki",
	config = function()
		vim.cmd([[source ~/.config/nvim/lua/zachyho/plugins/vim_zettel/config.vim]])

		local zettel_index = "~/vimwiki/zachtelkasten/index.md"
		map("n", "<leader>ztn", ":e " .. zettel_index .. " | " .. ":ZettelNew<CR>")
	end,
}
