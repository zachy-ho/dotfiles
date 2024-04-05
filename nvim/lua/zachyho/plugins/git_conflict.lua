return {
	"akinsho/git-conflict.nvim",
	version = "*",
	config = function()
		require("git-conflict").setup({})
		map("n", "<leader>gcl", ":GitConflictListQf<CR>")
	end,
	event = "VeryLazy",
}
