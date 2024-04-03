return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			signcolumn = true,
			numhl = true,
			linehl = true,
			word_diff = true,
		})
		map("n", "<leader>gsl", function()
			require("gitsigns").toggle_deleted(false)
			require("gitsigns").toggle_word_diff()
			require("gitsigns").toggle_linehl()
			require("gitsigns").toggle_numhl()
			require("gitsigns").toggle_signs()
		end)
	end,
	lazy = true,
	keys = {
		{ "<leader>gsp", ":Gitsigns ", "gitsigns pick" },
	},
}
