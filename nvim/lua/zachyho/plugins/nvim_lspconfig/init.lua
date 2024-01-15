return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Null-ls
		"jose-elias-alvarez/null-ls.nvim",
		-- Completion source for nvim-lsp. Required in LSP handlers.
		"hrsh7th/cmp-nvim-lsp",
		-- Lspkind: Cute logos for LSP
		"onsails/lspkind-nvim",
	},
	config = function()
		local lsp = safe_require(local_paths.PLUGINS_DIR .. "nvim_lspconfig.config")
		if lsp then
			lsp.setup()
		end
	end,
}
