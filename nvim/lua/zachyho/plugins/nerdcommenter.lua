return {
	"preservim/nerdcommenter",
	config = function()
		vim.g.NERDSpaceDelims = 1
		vim.g.NERDCommenterMappings = 0
		map("n", "<leader>c<space>", "<Plug>NERDCommenterToggle")
		map("n", "<leader>cn", "<Plug>NERDCommenterNested")
		map("n", "<leader>cy", "<Plug>NERDCommenterYank")
	end,
	keys = {
		"<leader>c<space>",
		"<leader>cn",
		"<leader>cy",
	},
}
