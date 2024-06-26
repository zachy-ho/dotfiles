return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("nvim-tree").setup({
			disable_netrw = false,
			hijack_netrw = true,
			view = {
				width = 60,
				side = "right",
			},
			renderer = {
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "",
							arrow_open = "",
						},
					},
				},
			},
			git = {
				ignore = false,
			},
		})
	end,
	keys = {
		{ "<leader>nt", ":NvimTreeToggle<CR>", desc = "toggle filetree" },
		{ "<leader>nb", ":NvimTreeFindFile<CR>", desc = "find file in tree" },
		{ "<leader>nf", ":NvimTreeFocus<CR>", desc = "focus tree" },
	},
}
