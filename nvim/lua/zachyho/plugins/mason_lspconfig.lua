return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = "williamboman/mason.nvim",
	config = function()
		-- Mason lsp
		local mason_lsp = safe_require("mason-lspconfig")
		if not mason_lsp then
			return
		end

		local server_configs = safe_require(local_paths.PLUGINS_DIR .. "nvim_lspconfig.server_configs")
		local ensure_installed = {}
		if server_configs then
			ensure_installed = table_utils.get_keys(server_configs)
		end
		mason_lsp.setup({
			ensure_installed,
		})
	end,
}
