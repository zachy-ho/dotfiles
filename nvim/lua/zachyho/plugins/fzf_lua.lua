return {
	"ibhagwan/fzf-lua",
	dependencies = {
		{
			"junegunn/fzf",
			build = "./install --bin",
			lazy = true,
		},
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("fzf-lua").setup({})
		map("n", "<leader>fl", ":FzfLua")
		map("n", "<leader>ff", ":FzfLua files")
		map("n", "<leader>lg", ":FzfLua live_grep")
	end,
}
