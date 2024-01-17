return {
	"akinsho/git-conflict.nvim",
	version = "*",
	config = function()
		require("git-conflict").setup({
			highlights = {
				incoming = "DiffAdd",
				current = "DiffChange",
			},
		})
		map("n", "<leader>gcl", ":GitConflictListQf<CR>")
	end,
	event = "VeryLazy",
}
