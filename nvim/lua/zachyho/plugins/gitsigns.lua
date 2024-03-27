return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			signcolumn = true,
			numhl = true,
			linehl = true,
			word_diff = true,
		})
		map("n", "<leader>gs", ":Gitsigns ")
	end,
	lazy = true,
	keys = {
		{ "<leader>gs", ":Gitsigns " },
	},
}
