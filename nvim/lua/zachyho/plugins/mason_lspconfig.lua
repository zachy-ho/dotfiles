return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = "williamboman/mason.nvim",
	config = function()
		-- Mason lsp

		-- TODO handle new server configs
		-- local server_configs = require("zachyho.plugins.nvim_lspconfig.server_configs")
		-- local ensure_installed = {}
		-- if server_configs then
		-- ensure_installed = table_utils.get_keys(server_configs)
		-- end
		require("mason-lspconfig").setup({
			-- ensure_installed,
		})
	end,
}
