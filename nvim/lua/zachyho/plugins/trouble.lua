return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		map("n", "<leader>tt", ":TroubleToggle ")
		-- map("n", "<leader>gd", ":TroubleToggle lsp_definitions<CR>")
		map("n", "<leader>fr", ":TroubleToggle lsp_references<CR>")
		map("n", "<leader>dd", ":TroubleToggle document_diagnostics<CR>")
	end,
}
