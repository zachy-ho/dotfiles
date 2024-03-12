return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Null-ls
		"nvimtools/none-ls.nvim",
		"nvimtools/none-ls-extras.nvim",
		-- Completion source for nvim-lsp. Required in LSP handlers.
		"hrsh7th/cmp-nvim-lsp",
		-- Lspkind: Cute logos for LSP
		"onsails/lspkind-nvim",
	},
	config = function()
		require("zachyho.plugins.nvim_lspconfig.config").setup()
	end,
}
