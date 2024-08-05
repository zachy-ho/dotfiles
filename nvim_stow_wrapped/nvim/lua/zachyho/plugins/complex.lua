-- my local complex.nvim plugin
return {
	dir = "~/projects/complex.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("complex")
		-- dev
		map("n", "<leader>dl", ":lua package.loaded['complex'] = nil<CR>")
		map("n", "<leader>cp", ":lua require'complex'.get_function_complexity()<CR>")
		map("n", "<leader>rt", ":PlenaryBustedFile %<CR>")
	end,
}
