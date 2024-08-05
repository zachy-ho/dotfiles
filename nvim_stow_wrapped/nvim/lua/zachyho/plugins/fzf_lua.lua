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
		require("fzf-lua").setup({
			files = {
				rg_opts = "--files --hidden --follow --no-ignore -g '!.git'",
			},
		})
		map("n", "<leader>fl", ":FzfLua")
		map("n", "<leader>ff", ":FzfLua files")
		map("n", "<leader>lg", ":FzfLua live_grep")
		map("n", "<leader>gw", ":FzfLua grep_cword")
	end,
}
