return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = false,
			view_options = {
				show_hidden = true,
			},
		})
	end,
	keys = {
		{ "<leader>oi", "<CMD>Oil<CR>", desc = "Open parent directory" },
	},
}
