return {
	"opdavies/toggle-checkbox.nvim",
	config = function()
		map("n", "<leader>tl", ":lua require('toggle-checkbox).toggle()<CR>")
	end,
	keys = {
		{ "<leader>tl", ":lua require('toggle-checkbox).toggle()<CR>", desc = "toggle markdown checkbox" },
	},
}
