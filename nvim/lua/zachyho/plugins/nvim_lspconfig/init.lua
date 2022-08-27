return {
	"neovim/nvim-lspconfig",
	requires = {
		-- Null-ls
		{
			"jose-elias-alvarez/null-ls.nvim",
			requires = { "nvim-lua/plenary.nvim" },
		},
		-- Typescript add-ons
		"jose-elias-alvarez/typescript.nvim",
		-- Completion source for nvim-lsp. Required in LSP handlers.
		"hrsh7th/cmp-nvim-lsp",
		-- Lspkind: Cute logos for LSP
		"onsails/lspkind-nvim",
	},
	rocks = "luafilesystem",
	config = function()
		safe_require(constants.PLUGINS_DIR .. "nvim_lspconfig.config")
	end,
}
