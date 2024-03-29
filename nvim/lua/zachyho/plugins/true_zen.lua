return {
	"Pocco81/true-zen.nvim",
	config = function()
		require("true-zen").setup({
			integrations = {
				lualine = false,
			},
		})
		map("n", "<leader>za", ":TZAtaraxis<CR>")
		map("n", "<leader>zf", ":TZFocus<CR>")
		map("v", "<leader>zn", ":'<,'>TZNarrow<CR>")
		map("n", "<leader>zm", ":TZMinimalist<CR>")
	end,
}
