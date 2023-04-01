return {
	"preservim/nerdcommenter",
	config = function()
		vim.g.NERDSpaceDelims = 1
		vim.g.NERDCommenterMappings = 0
	end,
	keys = {
		{ "<leader>c<space>", "<Plug>NERDCommenterToggle", mode = { "v", "n" }, desc = "toggle comment" },
		{ "<leader>cy", "<Plug>NERDCommenterYank", mode = { "v", "n" }, desc = "yank commented" },
		{ "<leader>cn", "<Plug>NERDCommenterNested", desc = "nested comment" },
	},
}
