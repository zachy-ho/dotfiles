return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup()
	end,
	keys = {
		{ "<leader>oi", "<CMD>Oil<CR>", desc = "Open parent directory" },
	},
}
