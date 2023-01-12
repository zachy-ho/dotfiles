return {
	"preservim/nerdcommenter",
	config = function()
		vim.g.NERDSpaceDelims = 1
		vim.g.NERDCommenterMappings = 0
		map("vn", "<leader>c<space>", "<Plug>NERDCommenterToggle")
		map("n", "<leader>cn", "<Plug>NERDCommenterNested")
		map("vn", "<leader>cy", "<Plug>NERDCommenterYank")
	end,
	keys = {
		"<leader>c<space>",
		"<leader>cn",
		"<leader>cy",
	},
}
