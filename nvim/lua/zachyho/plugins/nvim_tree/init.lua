local nvim_tree = {
	"kyazdani42/nvim-tree.lua",
	version = "nightly", -- optional, updated every week. (see issue #1193)
	dependencies = "kyazdani42/nvim-web-devicons",
	config = function()
		local nvim_tree = safe_require("nvim-tree")
		if not nvim_tree then
			return
		end

		nvim_tree.setup({
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
return nvim_tree
