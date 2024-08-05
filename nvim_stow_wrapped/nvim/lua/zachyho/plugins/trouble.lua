return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Trouble",
	keys = {
		{
			"<leader>fr",
			"<cmd>Trouble lsp_references toggle",
			desc = "LSP references",
		},
	},
}
